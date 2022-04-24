// by nota

//com.sulake.core.window.components.ScrollBarController

package com.sulake.core.window.components
{
    import com.sulake.core.window.utils.tablet.ITouchAwareWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.events.WindowTouchEvent;
    import com.sulake.core.window._SafeStr_3133;

    public class ScrollBarController extends InteractiveController implements IScrollbarWindow, ITouchAwareWindow 
    {

        private static const SCROLL_BUTTON_INCREMENT:String = "increment";
        private static const SCROLL_BUTTON_DECREMENT:String = "decrement";
        private static const SCROLL_SLIDER_TRACK:String = "slider_track";
        private static const SCROLL_SLIDER_BAR:String = "slider_bar";

        protected var _offset:Number = 0;
        protected var _SafeStr_6440:Number = 0.1;
        protected var _SafeStr_6438:IScrollableWindow;
        private var _SafeStr_5555:Boolean;
        private var _targetName:String;
        private var _SafeStr_6439:Boolean = false;

        public function ScrollBarController(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:_SafeStr_3109, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0, _arg_12:IScrollableWindow=null)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            _SafeStr_4440 = false;
            _SafeStr_6438 = _arg_12;
            _SafeStr_5555 = (_arg_2 == 130);
            var _local_13:Array = [];
            groupChildrenWithTag("_INTERNAL", _local_13, -1);
            for each (var _local_14:_SafeStr_3109 in _local_13)
            {
                _local_14.procedure = scrollButtonEventProc;
            };
            updateLiftSizeAndPosition();
        }

        public function get scrollH():Number
        {
            return ((_SafeStr_5555) ? _offset : 0);
        }

        public function get scrollV():Number
        {
            return ((_SafeStr_5555) ? 0 : _offset);
        }

        public function get scrollable():IScrollableWindow
        {
            return (_SafeStr_6438);
        }

        public function set scrollH(_arg_1:Number):void
        {
            if (_SafeStr_5555)
            {
                if (setScrollPosition(_arg_1))
                {
                    updateLiftSizeAndPosition();
                };
            };
        }

        public function set scrollV(_arg_1:Number):void
        {
            if (!_SafeStr_5555)
            {
                if (setScrollPosition(_arg_1))
                {
                    updateLiftSizeAndPosition();
                };
            };
        }

        public function set scrollable(_arg_1:IScrollableWindow):void
        {
            if (((!(_SafeStr_6438 == null)) && (!(_SafeStr_6438.disposed))))
            {
                _SafeStr_6438.removeEventListener("WE_RESIZED", onScrollableResized);
                _SafeStr_6438.removeEventListener("WE_SCROLL", onScrollableScrolled);
            };
            _SafeStr_6438 = _arg_1;
            if (((!(_SafeStr_6438 == null)) && (!(_SafeStr_6438.disposed))))
            {
                _SafeStr_6438.addEventListener("WE_RESIZED", onScrollableResized);
                _SafeStr_6438.addEventListener("WE_SCROLL", onScrollableScrolled);
                updateLiftSizeAndPosition();
            };
        }

        public function get horizontal():Boolean
        {
            return (_SafeStr_5555);
        }

        public function get vertical():Boolean
        {
            return (!(_SafeStr_5555));
        }

        override public function get properties():Array
        {
            var _local_1:Array = super.properties;
            var _local_2:String;
            if ((_SafeStr_6438 is _SafeStr_3109))
            {
                _local_2 = _SafeStr_3109(_SafeStr_6438).name;
            }
            else
            {
                if (_targetName != null)
                {
                    _local_2 = _targetName;
                };
            };
            if (_local_2 == null)
            {
                _local_1.push(getDefaultProperty("scrollable"));
            }
            else
            {
                _local_1.push(createProperty("scrollable", _local_2));
            };
            return (_local_1);
        }

        override public function set properties(_arg_1:Array):void
        {
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "scrollable":
                        _targetName = (_local_2.value as String);
                        _SafeStr_6438 = null;
                };
            };
            super.properties = _arg_1;
        }

        protected function get track():WindowController
        {
            return (findChildByName("slider_track") as WindowController);
        }

        protected function get lift():WindowController
        {
            return (track.findChildByName("slider_bar") as WindowController);
        }

        override public function dispose():void
        {
            scrollable = null;
            super.dispose();
        }

        override public function enable():Boolean
        {
            var _local_1:* = null;
            var _local_2:uint;
            if (super.enable())
            {
                _local_1 = [];
                groupChildrenWithTag("_INTERNAL", _local_1, -1);
                _local_2 = 0;
                while (_local_2 < _local_1.length)
                {
                    _SafeStr_3109(_local_1[_local_2]).enable();
                    _local_2++;
                };
                return (true);
            };
            return (false);
        }

        override public function disable():Boolean
        {
            var _local_1:* = null;
            var _local_2:uint;
            if (super.disable())
            {
                _local_1 = [];
                groupChildrenWithTag("_INTERNAL", _local_1, -1);
                _local_2 = 0;
                while (_local_2 < _local_1.length)
                {
                    _SafeStr_3109(_local_1[_local_2]).disable();
                    _local_2++;
                };
                return (true);
            };
            return (false);
        }

        protected function setScrollPosition(_arg_1:Number):Boolean
        {
            var _local_2:Boolean;
            if (((_SafeStr_6438 == null) || (_SafeStr_6438.disposed)))
            {
                if (!resolveScrollTarget())
                {
                    return (false);
                };
            };
            if (_arg_1 < 0)
            {
                _arg_1 = 0;
            };
            if (_arg_1 > 1)
            {
                _arg_1 = 1;
            };
            _offset = _arg_1;
            if (_SafeStr_5555)
            {
                _local_2 = (!(_SafeStr_6438.scrollH == _offset));
                if (_local_2)
                {
                    _SafeStr_6438.scrollH = _offset;
                };
            }
            else
            {
                _local_2 = (!(_SafeStr_6438.scrollV == _offset));
                if (_local_2)
                {
                    _SafeStr_6438.scrollV = _offset;
                };
            };
            return (_local_2);
        }

        override public function update(_arg_1:WindowController, _arg_2:_SafeStr_3116):Boolean
        {
            switch (_arg_1.name)
            {
                case "slider_bar":
                    if (_arg_2.type == "WE_CHILD_RELOCATED")
                    {
                        if (!_SafeStr_6439)
                        {
                            if (_SafeStr_5555)
                            {
                                setScrollPosition(ScrollBarLiftController(_arg_1).scrollbarOffsetX);
                            }
                            else
                            {
                                setScrollPosition(ScrollBarLiftController(_arg_1).scrollbarOffsetY);
                            };
                        };
                    };
            };
            var _local_3:Boolean = super.update(_arg_1, _arg_2);
            if (_arg_2.type == "WE_PARENT_ADDED")
            {
                if (_SafeStr_6438 == null)
                {
                    resolveScrollTarget();
                };
            };
            if (_arg_1 == this)
            {
                if (_arg_2.type == "WE_RESIZED")
                {
                    updateLiftSizeAndPosition();
                }
                else
                {
                    if (_arg_2.type == "WME_WHEEL")
                    {
                        if (WindowMouseEvent(_arg_2).delta > 0)
                        {
                            if (_SafeStr_5555)
                            {
                                scrollH = (scrollH - _SafeStr_6440);
                            }
                            else
                            {
                                scrollV = (scrollV - _SafeStr_6440);
                            };
                        }
                        else
                        {
                            if (_SafeStr_5555)
                            {
                                scrollH = (scrollH + _SafeStr_6440);
                            }
                            else
                            {
                                scrollV = (scrollV + _SafeStr_6440);
                            };
                        };
                        _local_3 = true;
                    };
                };
            };
            return (_local_3);
        }

        private function updateLiftSizeAndPosition():void
        {
            var _local_3:int;
            var _local_4:Number;
            if (((_SafeStr_6438 == null) || (_SafeStr_6438.disposed)))
            {
                if (((_disposed) || (!(resolveScrollTarget()))))
                {
                    return;
                };
            };
            var _local_2:WindowController = track;
            var _local_1:WindowController = lift;
            if (_local_1 != null)
            {
                if (_SafeStr_5555)
                {
                    _local_4 = (_SafeStr_6438.visibleRegion.width / _SafeStr_6438.scrollableRegion.width);
                    if (_local_4 > 1)
                    {
                        _local_4 = 1;
                    };
                    _local_3 = (_local_4 * _local_2.width);
                    _local_1.width = _local_3;
                    _local_1.x = Math.round((_SafeStr_6438.scrollH * (_local_2.width - _local_3)));
                }
                else
                {
                    _local_4 = (_SafeStr_6438.visibleRegion.height / _SafeStr_6438.scrollableRegion.height);
                    if (_local_4 > 1)
                    {
                        _local_4 = 1;
                    };
                    _local_3 = (_local_4 * _local_2.height);
                    _local_1.height = _local_3;
                    _local_1.y = Math.round((_SafeStr_6438.scrollV * (_local_2.height - _local_1.height)));
                };
            };
            if (_local_4 == 1)
            {
                disable();
            }
            else
            {
                enable();
            };
        }

        private function nullEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
        }

        private function scrollButtonEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_3:* = null;
            var _local_6:Boolean;
            if (((_arg_1.type == "WME_DOWN") || (_arg_1.type == "WTE_TAP")))
            {
                if (_arg_2.name == "increment")
                {
                    if (_SafeStr_6438)
                    {
                        _SafeStr_6439 = true;
                        if (_SafeStr_5555)
                        {
                            scrollH = (scrollH + (_SafeStr_6438.scrollStepH / _SafeStr_6438.maxScrollH));
                        }
                        else
                        {
                            scrollV = (scrollV + (_SafeStr_6438.scrollStepV / _SafeStr_6438.maxScrollV));
                        };
                        _SafeStr_6439 = false;
                    };
                }
                else
                {
                    if (_arg_2.name == "decrement")
                    {
                        if (_SafeStr_6438)
                        {
                            _SafeStr_6439 = true;
                            if (_SafeStr_5555)
                            {
                                scrollH = (scrollH - (_SafeStr_6438.scrollStepH / _SafeStr_6438.maxScrollH));
                            }
                            else
                            {
                                scrollV = (scrollV - (_SafeStr_6438.scrollStepV / _SafeStr_6438.maxScrollV));
                            };
                            _SafeStr_6439 = false;
                        };
                    }
                    else
                    {
                        if (_arg_2.name == "slider_track")
                        {
                            if ((_arg_1 is WindowMouseEvent))
                            {
                                _local_5 = WindowMouseEvent(_arg_1).localX;
                                _local_4 = WindowMouseEvent(_arg_1).localY;
                            }
                            else
                            {
                                if ((_arg_1 is WindowTouchEvent))
                                {
                                    _local_5 = WindowTouchEvent(_arg_1).localX;
                                    _local_4 = WindowTouchEvent(_arg_1).localY;
                                };
                            };
                            _local_3 = WindowController(_arg_2).getChildByName("slider_bar");
                            if (_SafeStr_5555)
                            {
                                if (_local_5 < _local_3.x)
                                {
                                    scrollH = (scrollH - ((_SafeStr_6438.visibleRegion.width - _SafeStr_6438.scrollStepH) / _SafeStr_6438.maxScrollH));
                                }
                                else
                                {
                                    if (_local_5 > _local_3.right)
                                    {
                                        scrollH = (scrollH + ((_SafeStr_6438.visibleRegion.width - _SafeStr_6438.scrollStepH) / _SafeStr_6438.maxScrollH));
                                    };
                                };
                            }
                            else
                            {
                                if (_local_4 < _local_3.y)
                                {
                                    scrollV = (scrollV - ((_SafeStr_6438.visibleRegion.height - _SafeStr_6438.scrollStepV) / _SafeStr_6438.maxScrollV));
                                }
                                else
                                {
                                    if (_local_4 > _local_3.bottom)
                                    {
                                        scrollV = (scrollV + ((_SafeStr_6438.visibleRegion.height - _SafeStr_6438.scrollStepV) / _SafeStr_6438.maxScrollV));
                                    };
                                };
                            };
                            _local_6 = true;
                        };
                    };
                };
            };
            if (_arg_1.type == "WME_WHEEL")
            {
                if (WindowMouseEvent(_arg_1).delta > 0)
                {
                    if (_SafeStr_5555)
                    {
                        scrollH = (scrollH - _SafeStr_6440);
                    }
                    else
                    {
                        scrollV = (scrollV - _SafeStr_6440);
                    };
                }
                else
                {
                    if (_SafeStr_5555)
                    {
                        scrollH = (scrollH + _SafeStr_6440);
                    }
                    else
                    {
                        scrollV = (scrollV + _SafeStr_6440);
                    };
                };
                _local_6 = true;
            };
            if (_local_6)
            {
                updateLiftSizeAndPosition();
            };
        }

        private function resolveScrollTarget():Boolean
        {
            var _local_1:* = null;
            var _local_4:* = null;
            var _local_3:uint;
            var _local_2:uint;
            if (_SafeStr_6438 != null)
            {
                if (!_SafeStr_6438.disposed)
                {
                    return (true);
                };
            };
            if (_targetName != null)
            {
                _local_1 = (findParentByName(_targetName) as IScrollableWindow);
                if ((((_local_1 == null) && (_parent is _SafeStr_3133)) && (!(_parent is _SafeStr_3216))))
                {
                    _local_1 = (_SafeStr_3133(_parent).findChildByName(_targetName) as IScrollableWindow);
                    if (_local_1)
                    {
                        scrollable = _local_1;
                        return (true);
                    };
                };
            };
            if ((_parent is IScrollableWindow))
            {
                scrollable = IScrollableWindow(_parent);
                return (true);
            };
            if (((_parent is _SafeStr_3133) && (!(_parent is _SafeStr_3216))))
            {
                _local_2 = _SafeStr_3133(_parent).numChildren;
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _local_4 = (_SafeStr_3133(_parent).getChildAt(_local_3) as IScrollableWindow);
                    if (_local_4)
                    {
                        scrollable = _local_4;
                        return (true);
                    };
                    _local_3++;
                };
            };
            return (false);
        }

        private function onScrollableResized(_arg_1:_SafeStr_3116):void
        {
            updateLiftSizeAndPosition();
            setScrollPosition(_offset);
        }

        private function onScrollableScrolled(_arg_1:_SafeStr_3116):void
        {
            updateLiftSizeAndPosition();
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3216 = "_-o1L" (String#2319, DoABC#4)
// _SafeStr_4440 = "_-I1r" (String#4101, DoABC#4)
// _SafeStr_5555 = "_-a1a" (String#2262, DoABC#4)
// _SafeStr_6438 = "_-d1x" (String#1640, DoABC#4)
// _SafeStr_6439 = "_-dN" (String#7112, DoABC#4)
// _SafeStr_6440 = "_-D1Q" (String#8740, DoABC#4)


