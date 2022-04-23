// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.components.ScrollableItemGridWindow

package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.events._SafeStr_3116;

    public class ScrollableItemGridWindow extends WindowController implements IScrollableGridWindow 
    {

        private var _SafeStr_6108:IItemGridWindow;
        private var _SafeStr_5456:IScrollbarWindow;
        private var _SafeStr_5455:Boolean = true;

        public function ScrollableItemGridWindow(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:_SafeStr_3109, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            _scrollBar.scrollable = _itemGrid;
            if (_scrollBar.testStateFlag(32))
            {
                hideScrollBar();
            };
        }

        override public function get properties():Array
        {
            var _local_1:Array = super.properties;
            _local_1.push(createProperty("spacing", spacing));
            _local_1.push(createProperty("auto_arrange_items", autoArrangeItems));
            _local_1.push(createProperty("scale_to_fit_items", scaleToFitItems));
            _local_1.push(createProperty("resize_on_item_update", resizeOnItemUpdate));
            return (_local_1);
        }

        override public function set properties(_arg_1:Array):void
        {
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "spacing":
                        spacing = (_local_2.value as int);
                        break;
                    case "scale_to_fit_items":
                        scaleToFitItems = (_local_2.value as Boolean);
                        break;
                    case "resize_on_item_update":
                        resizeOnItemUpdate = (_local_2.value as Boolean);
                        break;
                    case "auto_arrange_items":
                        autoArrangeItems = (_local_2.value as Boolean);
                };
            };
            super.properties = _arg_1;
        }

        public function get autoHideScrollBar():Boolean
        {
            return (_SafeStr_5455);
        }

        public function set autoHideScrollBar(_arg_1:Boolean):void
        {
            _SafeStr_5455 = _arg_1;
            updateScrollBarVisibility();
        }

        public function get iterator():IIterator
        {
            return ((isConstructionReady()) ? _itemGrid.iterator : null);
        }

        public function get scrollH():Number
        {
            return (_itemGrid.scrollH);
        }

        public function set scrollH(_arg_1:Number):void
        {
            _itemGrid.scrollH = _arg_1;
        }

        public function get scrollV():Number
        {
            return (_itemGrid.scrollV);
        }

        public function set scrollV(_arg_1:Number):void
        {
            _itemGrid.scrollV = _arg_1;
        }

        public function get maxScrollH():int
        {
            return (_itemGrid.maxScrollH);
        }

        public function get maxScrollV():int
        {
            return (_itemGrid.maxScrollV);
        }

        public function get visibleRegion():Rectangle
        {
            return (_itemGrid.visibleRegion);
        }

        public function get scrollableRegion():Rectangle
        {
            return (_itemGrid.scrollableRegion);
        }

        public function get scrollStepH():Number
        {
            return (_itemGrid.scrollStepH);
        }

        public function set scrollStepH(_arg_1:Number):void
        {
            _itemGrid.scrollStepH = _arg_1;
        }

        public function get scrollStepV():Number
        {
            return (_itemGrid.scrollStepV);
        }

        public function set scrollStepV(_arg_1:Number):void
        {
            _itemGrid.scrollStepV = _arg_1;
        }

        public function get autoArrangeItems():Boolean
        {
            return (_itemGrid.autoArrangeItems);
        }

        public function set autoArrangeItems(_arg_1:Boolean):void
        {
            _itemGrid.autoArrangeItems = _arg_1;
        }

        public function get numColumns():uint
        {
            return (_itemGrid.numColumns);
        }

        public function get numRows():uint
        {
            return (_itemGrid.numRows);
        }

        public function get numGridItems():uint
        {
            return (_itemGrid.numGridItems);
        }

        public function get shouldRebuildGridOnResize():Boolean
        {
            return (_itemGrid.shouldRebuildGridOnResize);
        }

        public function set shouldRebuildGridOnResize(_arg_1:Boolean):void
        {
            _itemGrid.shouldRebuildGridOnResize = _arg_1;
        }

        public function get spacing():int
        {
            return (_itemGrid.spacing);
        }

        public function set spacing(_arg_1:int):void
        {
            _itemGrid.spacing = _arg_1;
        }

        public function set verticalSpacing(_arg_1:int):void
        {
            _itemGrid.verticalSpacing = _arg_1;
        }

        public function get scaleToFitItems():Boolean
        {
            return (_itemGrid.scaleToFitItems);
        }

        public function set scaleToFitItems(_arg_1:Boolean):void
        {
            _itemGrid.scaleToFitItems = _arg_1;
        }

        public function get resizeOnItemUpdate():Boolean
        {
            return (_itemGrid.resizeOnItemUpdate);
        }

        public function set resizeOnItemUpdate(_arg_1:Boolean):void
        {
            _itemGrid.resizeOnItemUpdate = _arg_1;
        }

        public function set containerResizeToColumns(_arg_1:Boolean):void
        {
        }

        public function get containerResizeToColumns():Boolean
        {
            return (false);
        }

        protected function get _itemGrid():IItemGridWindow
        {
            if (!_SafeStr_6108)
            {
                _SafeStr_6108 = (findChildByTag("_ITEMGRID") as IItemGridWindow);
            };
            return (_SafeStr_6108);
        }

        protected function get _scrollBar():IScrollbarWindow
        {
            if (!_SafeStr_5456)
            {
                _SafeStr_5456 = (findChildByTag("_SCROLLBAR") as IScrollbarWindow);
                if (_SafeStr_5456)
                {
                    _SafeStr_5456.addEventListener("WE_ENABLED", scrollBarEventProc);
                    _SafeStr_5456.addEventListener("WE_DISABLED", scrollBarEventProc);
                };
            };
            return (_SafeStr_5456);
        }

        override public function dispose():void
        {
            if (_SafeStr_5456)
            {
                _SafeStr_5456.removeEventListener("WE_ENABLED", scrollBarEventProc);
                _SafeStr_5456.removeEventListener("WE_DISABLED", scrollBarEventProc);
                _SafeStr_5456 = null;
            };
            if (_SafeStr_6108)
            {
                _SafeStr_6108 = null;
            };
            super.dispose();
        }

        public function addGridItem(_arg_1:_SafeStr_3109):_SafeStr_3109
        {
            return (_itemGrid.addGridItem(_arg_1));
        }

        public function addGridItemAt(_arg_1:_SafeStr_3109, _arg_2:uint):_SafeStr_3109
        {
            return (_itemGrid.addGridItemAt(_arg_1, _arg_2));
        }

        public function getGridItemAt(_arg_1:uint):_SafeStr_3109
        {
            return (_itemGrid.getGridItemAt(_arg_1));
        }

        public function getGridItemByID(_arg_1:uint):_SafeStr_3109
        {
            return (_itemGrid.getGridItemByID(_arg_1));
        }

        public function getGridItemByName(_arg_1:String):_SafeStr_3109
        {
            return (_itemGrid.getGridItemByName(_arg_1));
        }

        public function getGridItemByTag(_arg_1:String):_SafeStr_3109
        {
            return (_itemGrid.getGridItemByTag(_arg_1));
        }

        public function getGridItemIndex(_arg_1:_SafeStr_3109):int
        {
            return (_itemGrid.getGridItemIndex(_arg_1));
        }

        public function removeGridItem(_arg_1:_SafeStr_3109):_SafeStr_3109
        {
            return (_itemGrid.removeGridItem(_arg_1));
        }

        public function removeGridItemAt(_arg_1:int):_SafeStr_3109
        {
            return (_itemGrid.removeGridItemAt(_arg_1));
        }

        public function setGridItemIndex(_arg_1:_SafeStr_3109, _arg_2:int):void
        {
            _itemGrid.setGridItemIndex(_arg_1, _arg_2);
        }

        public function swapGridItems(_arg_1:_SafeStr_3109, _arg_2:_SafeStr_3109):void
        {
            _itemGrid.swapGridItems(_arg_1, _arg_2);
        }

        public function swapGridItemsAt(_arg_1:int, _arg_2:int):void
        {
            _itemGrid.swapGridItemsAt(_arg_1, _arg_2);
        }

        public function removeGridItems():void
        {
            _itemGrid.removeGridItems();
        }

        public function destroyGridItems():void
        {
            _itemGrid.destroyGridItems();
        }

        public function rebuildGridStructure():void
        {
            _itemGrid.rebuildGridStructure();
        }

        protected function isConstructionReady():Boolean
        {
            return ((_itemGrid) && (_scrollBar));
        }

        private function scrollBarEventProc(_arg_1:_SafeStr_3116):void
        {
            if (_arg_1.type == "WE_ENABLED")
            {
                showScrollBar();
            }
            else
            {
                if (_arg_1.type == "WE_DISABLED")
                {
                    hideScrollBar();
                };
            };
        }

        private function hideScrollBar():void
        {
            if (_scrollBar.visible)
            {
                _scrollBar.visible = false;
            };
        }

        private function showScrollBar():void
        {
            if (!_scrollBar.visible)
            {
                _scrollBar.visible = true;
            };
        }

        private function updateScrollBarVisibility():void
        {
            if (_SafeStr_5455)
            {
                if (_scrollBar.testStateFlag(32))
                {
                    if (_scrollBar.visible)
                    {
                        hideScrollBar();
                    };
                };
            }
            else
            {
                if (_scrollBar.visible)
                {
                    showScrollBar();
                };
            };
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_5455 = "_-hX" (String#5992, DoABC#4)
// _SafeStr_5456 = "_-M1F" (String#3105, DoABC#4)
// _SafeStr_6108 = "_-CI" (String#9263, DoABC#4)


