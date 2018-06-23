'use strict'

if (process.argv.length < 3){
  console.log('Usage node grapher.js <parsed nodes json>')
  process.exit(0)
}

function crossRef(arr1, arr2){
  let ret = []
  for (let idx = 0; idx < arr1.length; idx++) {
    if (arr2.some(a => a.trim() === arr1[idx].trim())) {
      ret.push(arr1[idx])
    }
  }
  return ret
}

function findSubscriptors(node, nodes){
  const ret = {}
  const filteredNodes = nodes
  // allow matching itself to find loops
  // nodes.filter(n => n.name.trim() !== node.name.trim())
  for (let pub of node.publications) {
    ret[pub] = []
    for (let n of filteredNodes) {
      if (n.subscriptions.some(sub => sub.trim() === pub.trim())) {
        ret[pub].push(n.name)
      }
    }
  }
  return ret
}

const graphviz = require('graphviz')
const graph = graphviz.digraph('G')

const parsedNodes = require(`${__dirname}/${process.argv[2]}`)
const nodeNames = parsedNodes.map(node => node.name)
// Paint the nodes
nodeNames.forEach(node => graph.addNode(node))

// Setup pubs/subs
for (let node of parsedNodes){
  const subscriptors = findSubscriptors(node,  parsedNodes)
  for (let sub in subscriptors) {
    const subscribedNodes = subscriptors[sub]
    for (let nodeName of subscribedNodes) {
      graph.addEdge(node.name, nodeName)
    }
  }
}

console.log('Done, here is your graph')
console.log(graph.to_dot())
