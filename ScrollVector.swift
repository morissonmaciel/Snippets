enum ScrollVector {
    case up
    case down
    case left
    case right
}

class CustomScrollView: UIScrollView {
    var lastScrollOffset: CGPoint = .zero
    
    override var contentOffset: CGPoint {
        didSet {
            computeScrollVector()
        }
    }
    
    func computeScrollVector() {
        let scrollVector: ScrollVector
        
        let contentOffsetDiff = CGPoint(x: contentOffset.x - lastScrollOffset.x, y: contentOffset.y - lastScrollOffset.y)
        
        if contentOffsetDiff.y > 0 {
            scrollVector = .down
        } else if contentOffsetDiff.y < 0 {
            scrollVector = .up
        } else if contentOffsetDiff.x > 0 {
            scrollVector = .right
        } else if contentOffsetDiff.x < 0 {
            scrollVector = .left
        } else {
            scrollVector = .up // Considered as up when there is no offset difference
        }
        
        // Use the scrollVector as needed
        
        lastScrollOffset = contentOffset
    }
    
    // Other customizations and functionality for your custom scroll view class
}
