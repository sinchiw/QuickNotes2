//
//  UICollectionViewFlowLayoutVC.swift
//  NoteMe2
//
//  Created by Wilmer sinchi on 3/21/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import UIKit
protocol PinterestLayoutDelegate: class {
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat
}

protocol MainCollectionLayoutDelegate: class {
    
    
   
    
    // collectionviw will follow in following order, pcl
    //prepare, collectionviewcontentsize, layoutattributesize
    
    
//    func collectionView(_ collectionView:UICollectionView, heightForEachCell indexPath:IndexPath) -> CGFloat
//}
//
//class MainCollectionViewLayout: UICollectionViewLayout {
//    //1 This keeps a reference to the delegate.
//    weak var delegate: MainCollectionLayoutDelegate!
//
//    //2 These are two properties for configuring the layout: the number of columns and the cell padding.
//
//    fileprivate var numberOfColumns = 1
//    fileprivate var cellPadding: CGFloat = 6
//
//    //3 This is an array to cache the calculated attributes. When you call prepare(), you’ll calculate the attributes for all items and add them to the cache. When the collection view later requests the layout attributes, you can be efficient and query the cache instead of recalculating them every time.
//
//    fileprivate var cache = [UICollectionViewLayoutAttributes]()
//
//    // 4
//    fileprivate var contentHeight: CGFloat = 10
//
//    fileprivate var contentWidth: CGFloat {
//        guard let collectionView = collectionView else {
//            return 0
//        }
//        let insets = collectionView.contentInset
//        return collectionView.bounds.width - (insets.left + insets.right)
//    }
//
//    // 5
//    override var collectionViewContentSize: CGSize {
//        return CGSize(width: contentWidth, height: contentHeight)
//    }
//
//
//    override func prepare() {
//        // 1
//        guard cache.isEmpty == true, let collectionView = collectionView else {
//            return
//        }
//        // 2
//        let columnWidth = contentWidth / CGFloat(numberOfColumns)
//        var xOffset = [CGFloat]()
//        for column in 0 ..< numberOfColumns {
//            xOffset.append(CGFloat(column) * columnWidth)
//        }
//        var column = 0
//        var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
//
//        // 3
//        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
//
//            let indexPath = IndexPath(item: item, section: 0)
//
//            // 4
////            let photoHeight = delegate.collectionView(collectionView, heightForEachCell: indexPath)
//            let height = cellPadding * 2
////                + photoHeight
//            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
//            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
//
//            // 5
//            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
//            attributes.frame = insetFrame
//            cache.append(attributes)
//
//            // 6
//            contentHeight = max(contentHeight, frame.maxY)
//            yOffset[column] = yOffset[column] + height
//
//            column = column < (numberOfColumns - 1) ? (column + 1) : 0
//        }
//    }
//
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//
//        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
//
//        // Loop through the cache and look for items in the rect
//        for attributes in cache {
//            if attributes.frame.intersects(rect) {
//                visibleLayoutAttributes.append(attributes)
//            }
//        }
//        return visibleLayoutAttributes
//    }
//
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        return cache[indexPath.item]
//    }

}

