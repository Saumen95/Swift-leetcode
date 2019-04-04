class Trie {
    
    private var children: [Character : TrieNode] = [:]
    
    /** Initialize your data structure here. */
    init() {
        self.children = [Character : TrieNode]()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {

        let firstCharacter = word.first!
        if let validChild = self.children[firstCharacter] {
            let subString = nextSubString(word)
            insert(subString, node: validChild)
        }
        else {
            insert(word, node: nil)
        }
    }
    
    func insert(_ word: String, node: TrieNode?) {
        
        guard word.length > 0 else {
            return 
        }
        
        let character = word.first!
        let substring = nextSubString(word)
        
        if let validChild = node {
            
            if let grandChild = validChild.childrenDictionary[character] {
                if substring.length > 0 {
                  insert(substring, node: grandChild)
                }
                else{
                    grandChild.isLeafNode = true
                }
            }
            else {
                let newNode = TrieNode(character: character)
                validChild.childrenDictionary[character] = newNode
                
                if substring.length > 0 {
                    insert(substring, node: newNode)
                }
                else {
                    newNode.isLeafNode = true
                }
            }
        }
        else {
            
            let node = TrieNode(character: character)
            self.children[character] = node
            
            if substring.length > 0 {
                insert(substring, node: node)
            }
            else {
                node.isLeafNode = true
            }
        }
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {

        guard word.count > 0 else {
            return false
        }
        
        if let validChild = self.children[word.first!] {
            let substring = nextSubString(word)
            return search(substring, node: validChild)
        }
        
        return false
    }
    
    func search(_ word: String, node: TrieNode) -> Bool {
        
        guard word.count > 0 else {
            return node.isLeafNode
        }
        
        let character = word.first!

        if let validChild = node.childrenDictionary[character] {
            
            let substring = nextSubString(word)
            return search(substring, node: validChild)
        }
    
        return false
    }
    
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
    
        guard prefix.count > 0 else {
            return false
        }
        
        guard self.children.keys.count > 0 else {
            return false
        }
        
        let character = prefix.first!
        let subString = nextSubString(prefix)
        
        if let validChild = self.children[character] {
            return startsWith(subString, node: validChild)
        }
        
        return false
    }
    
    func startsWith(_ prefix: String, node: TrieNode) -> Bool {
        
        guard prefix.count > 0 else {
           return true
        }
        
        let character = prefix.first!
        
        if let validNode = node.childrenDictionary[character] {

            let subString = nextSubString(prefix)
            return startsWith(subString, node: validNode)
        }
        
        return false
    }
    
    /** Helpers */
    func nextSubString(_ word: String) -> String {
        
        let startingIndex = word.index(word.startIndex, offsetBy: 1)
        let substring = String(word[startingIndex...])
        
        return substring
    }
}

class TrieNode {
    
    var character: Character
    var childrenDictionary: [Character: TrieNode] = [:]
    var isLeafNode: Bool = false
    
    init(character: Character) {
        self.character = character
    }
}