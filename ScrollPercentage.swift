enum ScrollDirection {
    case vertical
    case horizontal
}

func calculateScrollProgress(scrollView: UIScrollView, direction: ScrollDirection) -> CGFloat {
    let contentOffset: CGPoint
    let contentSize: CGSize
    let visibleSize: CGSize
    
    if direction == .vertical {
        contentOffset = scrollView.contentOffset
        contentSize = scrollView.contentSize
        visibleSize = scrollView.bounds.size
    } else {
        contentOffset = CGPoint(x: scrollView.contentOffset.x, y: 0)
        contentSize = CGSize(width: scrollView.contentSize.width, height: scrollView.bounds.height)
        visibleSize = CGSize(width: scrollView.bounds.width, height: scrollView.contentSize.height)
    }
    
    let scrollableLength: CGFloat
    let offset: CGFloat
    
    if direction == .vertical {
        scrollableLength = contentSize.height - visibleSize.height
        offset = contentOffset.y
    } else {
        scrollableLength = contentSize.width - visibleSize.width
        offset = contentOffset.x
    }
    
    guard scrollableLength > 0 else {
        return 0
    }
    
    let scrollProgressPercentage = (offset / scrollableLength) * 100
    
    return scrollProgressPercentage
}
