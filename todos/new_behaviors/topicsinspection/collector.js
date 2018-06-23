'use strict'

const { execSync } = require('child_process')
const { writeFileSync } = require('fs')

const commands = {
  'LIST_NODES': 'rosnode list',
  'INFO_NODES': 'rosnode info -q'
}

const execOptions = {
  cwd: __dirname,
  encoding: 'utf8'
}

const topicExtract = /\*\s?\/drone[0-9]{1,2}\/(\S+\s(?:\[\S+\/?\]|\[unknown type\])+)/g
let excludeNodes = []

let parsedNodes = []

if (process.argv.length < 2){
  console.log('Usage node collector.js [<node exclude file>]')
} else {
  excludeNodes = readToArray(process.argv)
}

function readToArray(filePath){
  console.log('ToDo')
  return []
}

function listNodes(){
  console.log(`Exec ${commands.LIST_NODES}...`)
  const nodes = execSync(commands.LIST_NODES, execOptions)
  return nodes.split('\n').filter(node => !!node.trim())
}

function infoNodes(node){
  console.log(`Exec ${commands.INFO_NODES} ${node}...`)
  return execSync(`${commands.INFO_NODES} ${node}`, execOptions)
}

function splitInfo(info){
  const split = info.split('Services:')
  const pubSubSplit = split[0].split('Subscriptions:')
  return [pubSubSplit[0].split('Publications:')[1], pubSubSplit[1]]
}

function parseNodeInfo(info){
  let topics = info.match(topicExtract)
  if (topics === null){
    // no matches
    topics = []
  }
  topics = topics.map(top => top.split(' ')[1])
  return topics
}

const nodes = listNodes()
console.log(`Parsed ${nodes.length} nodes`)
for (let node of nodes){
  if (!excludeNodes.some(n => n.trim() === node.trim())){
    const nodeInfo = infoNodes(node)
    const [pubsInfo, subsInfo] = splitInfo(nodeInfo)
    parsedNodes.push({
      'name': node,
      'publications': parseNodeInfo(pubsInfo),
      'subscriptions': parseNodeInfo(subsInfo)
    })
  }
}

console.log('Writting to file...')
writeFileSync('./parsedNodes.json', JSON.stringify(parsedNodes, null, 2), { encoding: 'utf8' })
