// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.utils.WindowRectLimits

package com.sulake.core.window.utils
{
    import com.sulake.core.window._SafeStr_3109;

    public class WindowRectLimits implements IRectLimiter 
    {

        private var _minWidth:int = -2147483648;
        private var _maxWidth:int = 2147483647;
        private var _SafeStr_4551:int = -2147483648;
        private var _SafeStr_5819:int = 2147483647;
        private var _SafeStr_4017:_SafeStr_3109;

        public function WindowRectLimits(_arg_1:_SafeStr_3109)
        {
            _SafeStr_4017 = _arg_1;
        }

        public function get minWidth():int
        {
            return (_minWidth);
        }

        public function get maxWidth():int
        {
            return (_maxWidth);
        }

        public function get minHeight():int
        {
            return (_SafeStr_4551);
        }

        public function get maxHeight():int
        {
            return (_SafeStr_5819);
        }

        public function set minWidth(_arg_1:int):void
        {
            _minWidth = _arg_1;
            if ((((_minWidth > -2147483648) && (!(_SafeStr_4017.disposed))) && (_SafeStr_4017.width < _minWidth)))
            {
                _SafeStr_4017.width = _minWidth;
            };
        }

        public function set maxWidth(_arg_1:int):void
        {
            _maxWidth = _arg_1;
            if ((((_maxWidth < 2147483647) && (!(_SafeStr_4017.disposed))) && (_SafeStr_4017.width > _maxWidth)))
            {
                _SafeStr_4017.width = _maxWidth;
            };
        }

        public function set minHeight(_arg_1:int):void
        {
            _SafeStr_4551 = _arg_1;
            if ((((_SafeStr_4551 > -2147483648) && (!(_SafeStr_4017.disposed))) && (_SafeStr_4017.height < _SafeStr_4551)))
            {
                _SafeStr_4017.height = _SafeStr_4551;
            };
        }

        public function set maxHeight(_arg_1:int):void
        {
            _SafeStr_5819 = _arg_1;
            if ((((_SafeStr_5819 < 2147483647) && (!(_SafeStr_4017.disposed))) && (_SafeStr_4017.height > _SafeStr_5819)))
            {
                _SafeStr_4017.height = _SafeStr_5819;
            };
        }

        public function get isEmpty():Boolean
        {
            return ((((_minWidth == -2147483648) && (_maxWidth == 2147483647)) && (_SafeStr_4551 == -2147483648)) && (_SafeStr_5819 == 2147483647));
        }

        public function setEmpty():void
        {
            _minWidth = -2147483648;
            _maxWidth = 2147483647;
            _SafeStr_4551 = -2147483648;
            _SafeStr_5819 = 2147483647;
        }

        public function limit():void
        {
            if (((!(isEmpty)) && (_SafeStr_4017)))
            {
                if (_SafeStr_4017.width < _minWidth)
                {
                    _SafeStr_4017.width = _minWidth;
                }
                else
                {
                    if (_SafeStr_4017.width > _maxWidth)
                    {
                        _SafeStr_4017.width = _maxWidth;
                    };
                };
                if (_SafeStr_4017.height < _SafeStr_4551)
                {
                    _SafeStr_4017.height = _SafeStr_4551;
                }
                else
                {
                    if (_SafeStr_4017.height > _SafeStr_5819)
                    {
                        _SafeStr_4017.height = _SafeStr_5819;
                    };
                };
            };
        }

        public function assign(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            _minWidth = _arg_1;
            _maxWidth = _arg_2;
            _SafeStr_4551 = _arg_3;
            _SafeStr_5819 = _arg_4;
            limit();
        }

        public function clone(_arg_1:_SafeStr_3109):WindowRectLimits
        {
            var _local_2:WindowRectLimits = new WindowRectLimits(_arg_1);
            _local_2._minWidth = _minWidth;
            _local_2._maxWidth = _maxWidth;
            _local_2._SafeStr_4551 = _SafeStr_4551;
            _local_2._SafeStr_5819 = _SafeStr_5819;
            return (_local_2);
        }


    }
}//package com.sulake.core.window.utils

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_4017 = "_-eB" (String#2049, DoABC#4)
// _SafeStr_4551 = "_-XD" (String#3918, DoABC#4)
// _SafeStr_5819 = "_-V9" (String#3780, DoABC#4)


