// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.iterators.SelectorIterator

package com.sulake.core.window.iterators
{
    import flash.utils.Proxy;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.components.SelectorController;
    import com.sulake.core.window.components.ISelectableWindow;
    import flash.utils.flash_proxy; 

    use namespace flash.utils.flash_proxy;

    public class SelectorIterator extends Proxy implements IIterator 
    {

        private var _SafeStr_6601:SelectorController;

        public function SelectorIterator(_arg_1:SelectorController)
        {
            _SafeStr_6601 = _arg_1;
        }

        public function get length():uint
        {
            return (_SafeStr_6601.numSelectables);
        }

        public function indexOf(_arg_1:*):int
        {
            return (_SafeStr_6601.getSelectableIndex(_arg_1));
        }

        override flash_proxy function getProperty(_arg_1:*):*
        {
            return (_SafeStr_6601.getChildAt(uint(_arg_1)));
        }

        override flash_proxy function setProperty(_arg_1:*, _arg_2:*):void
        {
            var _local_4:int;
            var _local_3:ISelectableWindow = (_arg_2 as ISelectableWindow);
            if (_local_3)
            {
                _local_4 = _SafeStr_6601.getSelectableIndex(_local_3);
                if (_local_4 == _arg_1)
                {
                    return;
                };
                if (_local_4 > -1)
                {
                    _SafeStr_6601.removeSelectable(_local_3);
                };
                _SafeStr_6601.addSelectableAt(_local_3, _arg_1);
            }
            else
            {
                _local_4 = _SafeStr_6601.getChildIndex(_arg_2);
                if (_local_4 == _arg_1)
                {
                    return;
                };
                if (_local_4 > -1)
                {
                    _SafeStr_6601.removeChild(_local_3);
                };
                _SafeStr_6601.addChildAt(_arg_2, _arg_1);
            };
        }

        override flash_proxy function nextNameIndex(_arg_1:int):int
        {
            return ((_arg_1 < _SafeStr_6601.numSelectables) ? (_arg_1 + 1) : 0);
        }

        override flash_proxy function nextValue(_arg_1:int):*
        {
            return (_SafeStr_6601.getSelectableAt((_arg_1 - 1)));
        }


    }
}//package com.sulake.core.window.iterators

// _SafeStr_6601 = "_-x1D" (String#1623, DoABC#4)


