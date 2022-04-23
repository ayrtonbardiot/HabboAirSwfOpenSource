// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.components.BoxSizerController

package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.utils.PropertyStruct;

    public class BoxSizerController extends ContainerController implements _SafeStr_3382 
    {

        private var _SafeStr_5549:int = 5;
        private var _SafeStr_6517:int = 8;
        private var _SafeStr_6518:int = 8;
        private var _SafeStr_5676:Boolean = false;
        private var _SafeStr_6516:Boolean = true;

        public function BoxSizerController(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:_SafeStr_3109, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        override public function update(_arg_1:WindowController, _arg_2:_SafeStr_3116):Boolean
        {
            switch (_arg_2.type)
            {
                case "WE_CHILD_RELOCATED":
                case "WE_CHILD_REMOVED":
                case "WE_CHILD_ADDED":
                case "WE_CHILD_RESIZED":
                case "WE_RESIZED":
                case "WE_CHILD_VISIBILITY":
                    arrangeChildren();
            };
            return (super.update(_arg_1, _arg_2));
        }

        private function arrangeChildren():void
        {
            var _local_4:* = null;
            if (!_SafeStr_6516)
            {
                return;
            };
            var _local_1:_SafeStr_3109;
            var _local_3:int = calculateSpaceForRelatives();
            var _local_2:int = getRelativeValuesSum();
            if (!_SafeStr_5676)
            {
                for each (_local_4 in _children)
                {
                    if (_local_4.visible)
                    {
                        if (!_local_1)
                        {
                            _local_4.x = _SafeStr_6517;
                        }
                        else
                        {
                            _local_4.x = ((_local_1.x + _local_1.width) + _SafeStr_5549);
                        };
                        _local_4.y = _SafeStr_6518;
                        if (getRelativeValue(_local_4) > 0)
                        {
                            _local_4.width = ((_local_3 * getRelativeValue(_local_4)) / _local_2);
                        };
                        _local_1 = _local_4;
                    };
                };
            }
            else
            {
                for each (_local_4 in _children)
                {
                    if (_local_4.visible)
                    {
                        if (!_local_1)
                        {
                            _local_4.y = _SafeStr_6518;
                        }
                        else
                        {
                            _local_4.y = ((_local_1.y + _local_1.height) + _SafeStr_5549);
                        };
                        _local_4.x = _SafeStr_6517;
                        if (getRelativeValue(_local_4) > 0)
                        {
                            _local_4.height = ((_local_3 * getRelativeValue(_local_4)) / _local_2);
                        };
                        _local_1 = _local_4;
                    };
                };
            };
        }

        private function getRelativeValue(_arg_1:_SafeStr_3109):int
        {
            var _local_3:* = null;
            var _local_2:int;
            var _local_4:int;
            _local_2 = 0;
            while (_local_2 < _arg_1.tags.length)
            {
                _local_3 = _arg_1.tags[_local_2];
                if (_local_3.indexOf("relative") != -1)
                {
                    _local_4 = _local_3.slice((_local_3.indexOf("(") + 1), _local_3.indexOf(")"));
                    if (_local_4 < 0)
                    {
                        _local_4 = 0;
                    };
                    _arg_1.tags.splice(_local_2, 1, (("relative(" + _local_4) + ")"));
                };
                _local_2++;
            };
            return (_local_4);
        }

        private function getRelativeValuesSum():int
        {
            var _local_1:int;
            for each (var _local_2:_SafeStr_3109 in _children)
            {
                if (_local_2.visible)
                {
                    _local_1 = (_local_1 + getRelativeValue(_local_2));
                };
            };
            return (_local_1);
        }

        private function calculateSpaceForRelatives():int
        {
            var _local_1:int = ((_SafeStr_5676) ? (this.height - (_SafeStr_6518 * 2)) : (this.width - (_SafeStr_6517 * 2)));
            for each (var _local_2:_SafeStr_3109 in _children)
            {
                if (_local_2.visible != false)
                {
                    if (getRelativeValue(_local_2) == 0)
                    {
                        if (_SafeStr_5676)
                        {
                            _local_1 = (_local_1 - (_local_2.height + _SafeStr_5549));
                        }
                        else
                        {
                            _local_1 = (_local_1 - (_local_2.width + _SafeStr_5549));
                        };
                    }
                    else
                    {
                        _local_1 = (_local_1 - _SafeStr_5549);
                    };
                };
            };
            return (_local_1 + _SafeStr_5549);
        }

        override public function get properties():Array
        {
            var _local_1:Array = super.properties;
            _local_1.push(createProperty("spacing", _SafeStr_5549));
            _local_1.push(createProperty("vertical", _SafeStr_5676));
            _local_1.push(createProperty("padding_horizontal", _SafeStr_6517));
            _local_1.push(createProperty("padding_vertical", _SafeStr_6518));
            return (_local_1);
        }

        override public function set properties(_arg_1:Array):void
        {
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "spacing":
                        _SafeStr_5549 = (_local_2.value as int);
                        break;
                    case "padding_horizontal":
                        _SafeStr_6517 = (_local_2.value as int);
                        break;
                    case "padding_vertical":
                        _SafeStr_6518 = (_local_2.value as int);
                        break;
                    case "vertical":
                        _SafeStr_5676 = (_local_2.value as Boolean);
                };
            };
            super.properties = _arg_1;
            arrangeChildren();
        }

        public function setHorizontalPadding(_arg_1:int):void
        {
            _SafeStr_6517 = _arg_1;
            arrangeChildren();
        }

        public function setVerticalPadding(_arg_1:int):void
        {
            _SafeStr_6518 = _arg_1;
            arrangeChildren();
        }

        public function setSpacing(_arg_1:int):void
        {
            _SafeStr_5549 = _arg_1;
            arrangeChildren();
        }

        public function setVertical(_arg_1:Boolean):void
        {
            _SafeStr_5676 = _arg_1;
            arrangeChildren();
        }

        public function setAutoRearrange(_arg_1:Boolean):void
        {
            _SafeStr_6516 = _arg_1;
            if (_arg_1)
            {
                arrangeChildren();
            };
        }

        public function getAutoRearrange():Boolean
        {
            return (_SafeStr_6516);
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3382 = "_-O13" (String#7685, DoABC#4)
// _SafeStr_5549 = "_-kU" (String#2439, DoABC#4)
// _SafeStr_5676 = "_-su" (String#2714, DoABC#4)
// _SafeStr_6516 = "_-oW" (String#15061, DoABC#4)
// _SafeStr_6517 = "_-o1r" (String#8056, DoABC#4)
// _SafeStr_6518 = "_-Jk" (String#8363, DoABC#4)


