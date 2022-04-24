// by nota

//com.sulake.core.window.iterators.DropListIterator

package com.sulake.core.window.iterators
{
    import flash.utils.Proxy;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.components.DropListController;
    import com.sulake.core.window._SafeStr_3109;
    import flash.utils.flash_proxy; 

    use namespace flash.utils.flash_proxy;

    public class DropListIterator extends Proxy implements IIterator 
    {

        private var _SafeStr_6601:DropListController;

        public function DropListIterator(_arg_1:DropListController)
        {
            _SafeStr_6601 = _arg_1;
        }

        public function get length():uint
        {
            return (_SafeStr_6601.numMenuItems);
        }

        public function indexOf(_arg_1:*):int
        {
            return (_SafeStr_6601.getMenuItemIndex(_arg_1));
        }

        override flash_proxy function getProperty(_arg_1:*):*
        {
            return (_SafeStr_6601.getMenuItemAt(uint(_arg_1)));
        }

        override flash_proxy function setProperty(_arg_1:*, _arg_2:*):void
        {
            var _local_3:* = null;
            _local_3 = (_arg_2 as _SafeStr_3109);
            var _local_4:int = _SafeStr_6601.getMenuItemIndex(_local_3);
            if (_local_4 == _arg_1)
            {
                return;
            };
            if (_local_4 > -1)
            {
                _SafeStr_6601.removeMenuItem(_local_3);
            };
            _SafeStr_6601.addMenuItemAt(_local_3, _arg_1);
        }

        override flash_proxy function nextNameIndex(_arg_1:int):int
        {
            return ((_arg_1 < _SafeStr_6601.numMenuItems) ? (_arg_1 + 1) : 0);
        }

        override flash_proxy function nextValue(_arg_1:int):*
        {
            return (_SafeStr_6601.getMenuItemAt((_arg_1 - 1)));
        }


    }
}//package com.sulake.core.window.iterators

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_6601 = "_-x1D" (String#1623, DoABC#4)


