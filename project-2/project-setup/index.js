/** IMPORTANT READ.
 * 
 * If `words.pl does not exist at root of /project-2,
 *  run this file once which will produce it.
 */

// How to Run in CLI.
// $ node index.js

(function initializeWords(){
  const fs = require("fs")
  
  const filterGoodWords = word => {
    return !(word.includes("-") || word.includes("_"))
  }
  
  const lowercaseWords = word => {
    return word.trim().toLowerCase()
  }

  const data = fs.readFileSync("./backup.txt", "utf8")
  const words = data.split("\n")
  const reducedWords = words.filter(filterGoodWords)  
                            .map(lowercaseWords)

  const file = fs.createWriteStream("../words.pl")
  file.on("error", err => console.log(err))
  reducedWords.forEach(word => {
    const splitWord = word.split("")
    file.write(`word(${word}, [${splitWord}]).\n`)
  })
  file.end()
  console.log("Completed Init. output.pl Ready.")
})()