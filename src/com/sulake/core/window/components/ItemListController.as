// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.components.ItemListController

package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.utils.IInputProcessorRoot;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.theme.IThemeManager;
    import flash.geom.Rectangle;
    import com.sulake.core.window.WindowContext;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.iterators.ItemListIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.utils.PropertyStruct;

    public class ItemListController extends WindowController implements IItemListWindow, IInputProcessorRoot 
    {

        private var _SafeStr_5558:Boolean = false;
        private var _SafeStr_5553:Boolean = false;
        protected var _SafeStr_5550:Number = 0;
        protected var _SafeStr_5551:Number = 0;
        protected var _scrollAreaWidth:Number = 0;
        protected var _SafeStr_5552:Number = 0;
        protected var _container:_SafeStr_3133;
        protected var _SafeStr_5562:Boolean = false;
        protected var _SafeStr_5563:Boolean = false;
        protected var _SafeStr_5549:int;
        protected var _SafeStr_5555:Boolean = false;
        protected var _SafeStr_5554:Number = -1;
        protected var _SafeStr_5556:Number = -1;
        protected var _arrangeListItems:Boolean;
        protected var _scaleToFitItems:Boolean;
        protected var _resizeOnItemUpdate:Boolean;
        protected var _SafeStr_5560:Number;
        protected var _SafeStr_5266:Number;
        protected var _SafeStr_5559:Number;
        protected var _SafeStr_5561:Number;
        protected var _SafeStr_5557:Boolean;

        public function ItemListController(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:_SafeStr_3109, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            _SafeStr_5555 = (_arg_2 == 51);
            var _local_12:IThemeManager = _arg_5.getWindowFactory().getThemeManager();
            _SafeStr_5549 = _local_12.getPropertyDefaults(_arg_3).get("spacing").value;
            _arrangeListItems = _local_12.getPropertyDefaults(_arg_3).get("auto_arrange_items").value;
            _scaleToFitItems = _local_12.getPropertyDefaults(_arg_3).get("scale_to_fit_items").value;
            _resizeOnItemUpdate = _local_12.getPropertyDefaults(_arg_3).get("resize_on_item_update").value;
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            _SafeStr_4440 = ((_background) || (!(testParamFlag(16))));
            _container = (_context.create("_CONTAINER", "", 4, 0, ((0x10 | 0x00) | 0x00), new Rectangle(0, 0, width, height), null, this, 0, null, "", ["_INTERNAL", "_EXCLUDE"]) as _SafeStr_3133);
            _container.addEventListener("WE_RESIZED", containerEventHandler);
            _container.addEventListener("WE_CHILD_REMOVED", containerEventHandler);
            _container.addEventListener("WE_CHILD_RESIZED", containerEventHandler);
            _container.addEventListener("WE_CHILD_RELOCATED", containerEventHandler);
            _container.clipping = clipping;
            resizeOnItemUpdate = _resizeOnItemUpdate;
        }

        public function get spacing():int
        {
            return (_SafeStr_5549);
        }

        public function set spacing(_arg_1:int):void
        {
            if (_arg_1 != _SafeStr_5549)
            {
                _SafeStr_5549 = _arg_1;
                updateScrollAreaRegion();
            };
        }

        public function get scrollH():Number
        {
            return (_SafeStr_5550);
        }

        public function get scrollV():Number
        {
            return (_SafeStr_5551);
        }

        public function get maxScrollH():int
        {
            return (Math.max(0, (_scrollAreaWidth - width)));
        }

        public function get maxScrollV():int
        {
            return (Math.max(0, (_SafeStr_5552 - height)));
        }

        public function get isPartOfGridWindow():Boolean
        {
            return (_SafeStr_5553);
        }

        public function set isPartOfGridWindow(_arg_1:Boolean):void
        {
            _SafeStr_5553 = _arg_1;
        }

        public function get scrollableWindow():_SafeStr_3109
        {
            return (this);
        }

        public function get visibleRegion():Rectangle
        {
            return (new Rectangle((_SafeStr_5550 * maxScrollH), (_SafeStr_5551 * maxScrollV), width, height));
        }

        public function get scrollableRegion():Rectangle
        {
            return (_container.rectangle);
        }

        public function set scrollH(_arg_1:Number):void
        {
            var _local_2:* = null;
            if (_arg_1 < 0)
            {
                _arg_1 = 0;
            };
            if (_arg_1 > 1)
            {
                _arg_1 = 1;
            };
            if (_arg_1 != _SafeStr_5550)
            {
                _SafeStr_5550 = _arg_1;
                _container.x = (-(_SafeStr_5550) * maxScrollH);
                _context.invalidate(_container, visibleRegion, 1);
                if (_SafeStr_3983)
                {
                    _local_2 = _SafeStr_3116.allocate("WE_SCROLL", this, null);
                    _SafeStr_3983.dispatchEvent(_local_2);
                    _local_2.recycle();
                };
            };
        }

        public function set scrollV(_arg_1:Number):void
        {
            var _local_2:* = null;
            if (_arg_1 < 0)
            {
                _arg_1 = 0;
            };
            if (_arg_1 > 1)
            {
                _arg_1 = 1;
            };
            if (_arg_1 != _SafeStr_5551)
            {
                _SafeStr_5551 = _arg_1;
                _container.y = (-(_SafeStr_5551) * maxScrollV);
                if (_SafeStr_3983)
                {
                    _local_2 = _SafeStr_3116.allocate("WE_SCROLL", this, null);
                    _SafeStr_3983.dispatchEvent(_local_2);
                    _local_2.recycle();
                };
            };
        }

        public function get scrollStepH():Number
        {
            if (_SafeStr_5554 >= 0)
            {
                return (_SafeStr_5554);
            };
            return ((_SafeStr_5555) ? (_container.width / numListItems) : (0.1 * _container.width));
        }

        public function get scrollStepV():Number
        {
            if (_SafeStr_5556 >= 0)
            {
                return (_SafeStr_5556);
            };
            return ((_SafeStr_5555) ? (0.1 * _container.height) : (_container.height / numListItems));
        }

        public function set scrollStepH(_arg_1:Number):void
        {
            _SafeStr_5554 = _arg_1;
        }

        public function set scrollStepV(_arg_1:Number):void
        {
            _SafeStr_5556 = _arg_1;
        }

        public function set scaleToFitItems(_arg_1:Boolean):void
        {
            if (_scaleToFitItems != _arg_1)
            {
                _scaleToFitItems = _arg_1;
                updateScrollAreaRegion();
            };
        }

        public function get scaleToFitItems():Boolean
        {
            return (_scaleToFitItems);
        }

        public function set autoArrangeItems(_arg_1:Boolean):void
        {
            _arrangeListItems = _arg_1;
            updateScrollAreaRegion();
        }

        public function get autoArrangeItems():Boolean
        {
            return (_arrangeListItems);
        }

        public function set resizeOnItemUpdate(_arg_1:Boolean):void
        {
            _resizeOnItemUpdate = _arg_1;
            if (_container)
            {
                if (_SafeStr_5555)
                {
                    _container.setParamFlag(0x400000, _arg_1);
                }
                else
                {
                    _container.setParamFlag(0x800000, _arg_1);
                };
            };
        }

        public function get resizeOnItemUpdate():Boolean
        {
            return (_resizeOnItemUpdate);
        }

        public function get iterator():IIterator
        {
            return (new ItemListIterator(this));
        }

        public function get firstListItem():_SafeStr_3109
        {
            return ((numListItems > 0) ? getListItemAt(0) : null);
        }

        public function get lastListItem():_SafeStr_3109
        {
            return ((numListItems > 0) ? getListItemAt((numListItems - 1)) : null);
        }

        override public function set clipping(_arg_1:Boolean):void
        {
            super.clipping = _arg_1;
            if (_container)
            {
                _container.clipping = _arg_1;
            };
        }

        override public function dispose():void
        {
            if (!_disposed)
            {
                _container.removeEventListener("WE_RESIZED", containerEventHandler);
                _container.removeEventListener("WE_CHILD_REMOVED", containerEventHandler);
                _container.removeEventListener("WE_CHILD_RESIZED", containerEventHandler);
                _container.removeEventListener("WE_CHILD_RELOCATED", containerEventHandler);
                super.dispose();
            };
        }

        override protected function cloneChildWindows(_arg_1:WindowController):void
        {
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < numListItems)
            {
                IItemListWindow(_arg_1).addListItem(getListItemAt(_local_2).clone());
                _local_2++;
            };
        }

        public function get numListItems():int
        {
            return ((_container != null) ? _container.numChildren : 0);
        }

        public function addListItem(_arg_1:_SafeStr_3109):_SafeStr_3109
        {
            _SafeStr_5563 = true;
            if (_SafeStr_5555)
            {
                _arg_1.x = (_scrollAreaWidth + ((numListItems > 0) ? _SafeStr_5549 : 0));
                _scrollAreaWidth = _arg_1.right;
                _container.width = _scrollAreaWidth;
            }
            else
            {
                if (autoArrangeItems)
                {
                    _arg_1.y = (_SafeStr_5552 + ((numListItems > 0) ? _SafeStr_5549 : 0));
                    _SafeStr_5552 = _arg_1.bottom;
                }
                else
                {
                    _SafeStr_5552 = Math.max(_SafeStr_5552, _arg_1.bottom);
                };
                _container.height = _SafeStr_5552;
            };
            _arg_1 = _container.addChild(_arg_1);
            _SafeStr_5563 = false;
            return (_arg_1);
        }

        public function addListItemAt(_arg_1:_SafeStr_3109, _arg_2:uint):_SafeStr_3109
        {
            _arg_1 = _container.addChildAt(_arg_1, _arg_2);
            updateScrollAreaRegion();
            return (_arg_1);
        }

        public function getListItemAt(_arg_1:uint):_SafeStr_3109
        {
            return (_container.getChildAt(_arg_1));
        }

        public function getListItemByID(_arg_1:uint):_SafeStr_3109
        {
            return (_container.getChildByID(_arg_1));
        }

        public function getListItemByName(_arg_1:String):_SafeStr_3109
        {
            return (_container.getChildByName(_arg_1));
        }

        public function getListItemByTag(_arg_1:String):_SafeStr_3109
        {
            return (_container.getChildByTag(_arg_1));
        }

        public function getListItemIndex(_arg_1:_SafeStr_3109):int
        {
            return (_container.getChildIndex(_arg_1));
        }

        public function removeListItem(_arg_1:_SafeStr_3109):_SafeStr_3109
        {
            _arg_1 = _container.removeChild(_arg_1);
            if (_arg_1)
            {
                updateScrollAreaRegion();
            };
            return (_arg_1);
        }

        public function removeListItemAt(_arg_1:int):_SafeStr_3109
        {
            return (_container.removeChildAt(_arg_1));
        }

        public function setListItemIndex(_arg_1:_SafeStr_3109, _arg_2:int):void
        {
            _container.setChildIndex(_arg_1, _arg_2);
        }

        public function swapListItems(_arg_1:_SafeStr_3109, _arg_2:_SafeStr_3109):void
        {
            _container.swapChildren(_arg_1, _arg_2);
            updateScrollAreaRegion();
        }

        public function swapListItemsAt(_arg_1:int, _arg_2:int):void
        {
            _container.swapChildrenAt(_arg_1, _arg_2);
            updateScrollAreaRegion();
        }

        public function groupListItemsWithID(_arg_1:uint, _arg_2:Array, _arg_3:int=0):uint
        {
            return (_container.groupChildrenWithID(_arg_1, _arg_2, _arg_3));
        }

        public function groupListItemsWithTag(_arg_1:String, _arg_2:Array, _arg_3:int=0):uint
        {
            return (_container.groupChildrenWithTag(_arg_1, _arg_2, _arg_3));
        }

        public function removeListItems():void
        {
            _SafeStr_5563 = true;
            while (numListItems > 0)
            {
                _container.removeChildAt(0);
            };
            _SafeStr_5563 = false;
            updateScrollAreaRegion();
        }

        public function destroyListItems():void
        {
            _SafeStr_5563 = true;
            while (numListItems > 0)
            {
                _container.removeChildAt(0).destroy();
            };
            _SafeStr_5563 = false;
            updateScrollAreaRegion();
        }

        public function arrangeListItems():void
        {
            updateScrollAreaRegion();
        }

        override public function populate(_arg_1:Array):void
        {
            WindowController(_container).populate(_arg_1);
            updateScrollAreaRegion();
        }

        override public function update(_arg_1:WindowController, _arg_2:_SafeStr_3116):Boolean
        {
            var _local_3:Boolean = super.update(_arg_1, _arg_2);
            switch (_arg_2.type)
            {
                case "WE_RESIZE":
                    _SafeStr_5562 = true;
                    break;
                case "WE_RESIZED":
                    if (!_scaleToFitItems)
                    {
                        if (_SafeStr_5555)
                        {
                            _container.height = _SafeStr_4423;
                        }
                        else
                        {
                            _container.width = _SafeStr_4422;
                        };
                    };
                    updateScrollAreaRegion();
                    _SafeStr_5562 = false;
                    break;
                default:
                    if ((_arg_2 is _SafeStr_3116))
                    {
                        _local_3 = process((_arg_2 as _SafeStr_3116));
                    };
            };
            return (_local_3);
        }

        public function process(_arg_1:_SafeStr_3116):Boolean
        {
            var _local_5:Boolean;
            var _local_3:int;
            var _local_4:int;
            var _local_2:int;
            if ((_arg_1 is WindowMouseEvent))
            {
                _local_3 = WindowMouseEvent(_arg_1).localX;
                _local_4 = WindowMouseEvent(_arg_1).localY;
                _local_2 = WindowMouseEvent(_arg_1).delta;
            };
            switch (_arg_1.type)
            {
                case "WME_WHEEL":
                    if (_SafeStr_5555)
                    {
                        scrollH = (scrollH - ((_local_2 * scrollStepH) / maxScrollH));
                    }
                    else
                    {
                        scrollV = (scrollV - ((_local_2 * scrollStepV) / maxScrollV));
                    };
                    _local_5 = (!(_SafeStr_5553));
                    break;
                case "WME_DOWN":
                    _SafeStr_5560 = _local_3;
                    _SafeStr_5266 = _local_4;
                    _SafeStr_5559 = (_SafeStr_5550 * maxScrollH);
                    _SafeStr_5561 = (_SafeStr_5551 * maxScrollV);
                    _SafeStr_5557 = true;
                    _local_5 = true;
                    break;
                case "WME_MOVE":
                    if (((_SafeStr_5557) && (!(_SafeStr_5558))))
                    {
                        if (_SafeStr_5555)
                        {
                            scrollH = (((_SafeStr_5559 + _SafeStr_5560) - _local_3) / maxScrollH);
                        }
                        else
                        {
                            scrollV = (((_SafeStr_5561 + _SafeStr_5266) - _local_4) / maxScrollV);
                        };
                        _local_5 = true;
                    };
                    break;
                case "WME_UP":
                case "WME_UP_OUTSIDE":
                    if (_SafeStr_5557)
                    {
                        _SafeStr_5557 = false;
                        _local_5 = true;
                    };
            };
            return (_local_5);
        }

        private function scrollAnimationCallback(_arg_1:int, _arg_2:int):void
        {
            if (!disposed)
            {
                scrollH = (scrollH - (_arg_1 / _scrollAreaWidth));
                scrollV = (scrollV - (_arg_2 / _SafeStr_5552));
            };
        }

        private function containerEventHandler(_arg_1:_SafeStr_3116):void
        {
            var _local_2:* = null;
            switch (_arg_1.type)
            {
                case "WE_CHILD_REMOVED":
                    updateScrollAreaRegion();
                    return;
                case "WE_CHILD_RESIZED":
                    if (!_SafeStr_5562)
                    {
                        updateScrollAreaRegion();
                    };
                    return;
                case "WE_CHILD_RELOCATED":
                    updateScrollAreaRegion();
                    return;
                case "WE_RESIZED":
                    if (_SafeStr_3983)
                    {
                        _local_2 = _SafeStr_3116.allocate("WE_RESIZED", this, null);
                        _SafeStr_3983.dispatchEvent(_local_2);
                        _local_2.recycle();
                    };
                    return;
                default:
                    return;
            };
        }

        protected function updateScrollAreaRegion():void
        {
            var _local_4:* = null;
            var _local_1:int;
            var _local_3:uint;
            var _local_2:uint;
            if ((((_arrangeListItems) && (!(_SafeStr_5563))) && (_container)))
            {
                _SafeStr_5563 = true;
                _local_2 = _container.numChildren;
                if (_SafeStr_5555)
                {
                    _scrollAreaWidth = 0;
                    _SafeStr_5552 = _SafeStr_4423;
                    _local_3 = 0;
                    while (_local_3 < _local_2)
                    {
                        _local_4 = _container.getChildAt(_local_3);
                        if (_local_4.visible)
                        {
                            _local_4.x = _scrollAreaWidth;
                            _scrollAreaWidth = (_scrollAreaWidth + (_local_4.width + _SafeStr_5549));
                            if (_scaleToFitItems)
                            {
                                _local_1 = (_local_4.height + _local_4.y);
                                _SafeStr_5552 = ((_local_1 > _SafeStr_5552) ? _local_1 : _SafeStr_5552);
                            };
                        };
                        _local_3++;
                    };
                    if (_local_2 > 0)
                    {
                        _scrollAreaWidth = (_scrollAreaWidth - _SafeStr_5549);
                    };
                }
                else
                {
                    _scrollAreaWidth = _SafeStr_4422;
                    _SafeStr_5552 = 0;
                    _local_3 = 0;
                    while (_local_3 < _local_2)
                    {
                        _local_4 = _container.getChildAt(_local_3);
                        if (_local_4.visible)
                        {
                            _local_4.y = _SafeStr_5552;
                            _SafeStr_5552 = (_SafeStr_5552 + (_local_4.height + _SafeStr_5549));
                            if (_scaleToFitItems)
                            {
                                _local_1 = (_local_4.width + _local_4.x);
                                _scrollAreaWidth = ((_local_1 > _scrollAreaWidth) ? _local_1 : _scrollAreaWidth);
                            };
                        };
                        _local_3++;
                    };
                    if (_local_2 > 0)
                    {
                        _SafeStr_5552 = (_SafeStr_5552 - _SafeStr_5549);
                    };
                };
                if (_SafeStr_5550 > 0)
                {
                    if (_scrollAreaWidth <= _SafeStr_4422)
                    {
                        scrollH = 0;
                    }
                    else
                    {
                        _container.x = -(_SafeStr_5550 * maxScrollH);
                    };
                };
                if (_SafeStr_5551 > 0)
                {
                    if (_SafeStr_5552 <= _SafeStr_4423)
                    {
                        scrollV = 0;
                    }
                    else
                    {
                        _container.y = -(_SafeStr_5551 * maxScrollV);
                    };
                };
                _container.height = _SafeStr_5552;
                _container.width = _scrollAreaWidth;
                _SafeStr_5563 = false;
            };
        }

        override public function get properties():Array
        {
            var _local_1:Array = super.properties;
            _local_1.push(createProperty("spacing", _SafeStr_5549));
            _local_1.push(createProperty("auto_arrange_items", _arrangeListItems));
            _local_1.push(createProperty("scale_to_fit_items", _scaleToFitItems));
            _local_1.push(createProperty("resize_on_item_update", _resizeOnItemUpdate));
            _local_1.push(createProperty("scroll_step_h", _SafeStr_5554));
            _local_1.push(createProperty("scroll_step_v", _SafeStr_5556));
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
                        _arrangeListItems = (_local_2.value as Boolean);
                        break;
                    case "scroll_step_h":
                        _SafeStr_5554 = (_local_2.value as Number);
                        break;
                    case "scroll_step_v":
                        _SafeStr_5556 = (_local_2.value as Number);
                };
            };
            super.properties = _arg_1;
        }

        public function stopDragging():void
        {
            _SafeStr_5557 = false;
        }

        public function set disableAutodrag(_arg_1:Boolean):void
        {
            _SafeStr_5558 = _arg_1;
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3983 = "_-OX" (String#641, DoABC#4)
// _SafeStr_4422 = "_-a1T" (String#1398, DoABC#4)
// _SafeStr_4423 = "_-Ht" (String#1496, DoABC#4)
// _SafeStr_4440 = "_-I1r" (String#4101, DoABC#4)
// _SafeStr_5266 = "_-d1b" (String#5796, DoABC#4)
// _SafeStr_5549 = "_-kU" (String#2439, DoABC#4)
// _SafeStr_5550 = "_-Q1D" (String#6059, DoABC#4)
// _SafeStr_5551 = "_-K1J" (String#6523, DoABC#4)
// _SafeStr_5552 = "_-328" (String#2864, DoABC#4)
// _SafeStr_5553 = "_-E10" (String#14364, DoABC#4)
// _SafeStr_5554 = "_-a1m" (String#7545, DoABC#4)
// _SafeStr_5555 = "_-a1a" (String#2262, DoABC#4)
// _SafeStr_5556 = "_-vG" (String#7400, DoABC#4)
// _SafeStr_5557 = "_-R1N" (String#8024, DoABC#4)
// _SafeStr_5558 = "_-mA" (String#18194, DoABC#4)
// _SafeStr_5559 = "_-N1r" (String#21339, DoABC#4)
// _SafeStr_5560 = "_-31p" (String#19611, DoABC#4)
// _SafeStr_5561 = "_-yv" (String#18542, DoABC#4)
// _SafeStr_5562 = "_-P1V" (String#12194, DoABC#4)
// _SafeStr_5563 = "_-01N" (String#3443, DoABC#4)


