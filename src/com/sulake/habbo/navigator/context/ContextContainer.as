// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.context.ContextContainer

package com.sulake.habbo.navigator.context
{
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.core.utils._SafeStr_24;
    import __AS3__.vec.Vector;
    import _-21f._SafeStr_1598;
    import _-21f._SafeStr_1654;
    import _-Tr._SafeStr_1073;

    public class ContextContainer 
    {

        private var _navigator:HabboNewNavigator;
        private var _SafeStr_4706:_SafeStr_24;
        private var _SafeStr_4707:Vector.<_SafeStr_1598> = new Vector.<_SafeStr_1598>();

        public function ContextContainer(_arg_1:HabboNewNavigator)
        {
            _navigator = _arg_1;
        }

        public function hasContextFor(_arg_1:String):Boolean
        {
            if (!_SafeStr_4706)
            {
                return (false);
            };
            return (_SafeStr_4706.hasKey(_arg_1));
        }

        public function initialize(_arg_1:_SafeStr_1073):void
        {
            _SafeStr_4706 = new _SafeStr_24();
            for each (var _local_2:_SafeStr_1654 in _arg_1.topLevelContexts)
            {
                _SafeStr_4706.add(_local_2.searchCode, _local_2.quickLinks);
            };
        }

        public function getTopLevelSearches():Array
        {
            return (_SafeStr_4706.getKeys());
        }

        public function get savedSearches():Vector.<_SafeStr_1598>
        {
            return (_SafeStr_4707);
        }

        public function set savedSearches(_arg_1:Vector.<_SafeStr_1598>):void
        {
            _SafeStr_4707 = _arg_1;
        }

        public function isReady():Boolean
        {
            return (!(_SafeStr_4706 == null));
        }


    }
}//package com.sulake.habbo.navigator.context

// _SafeStr_1073 = "_-b14" (String#28772, DoABC#4)
// _SafeStr_1598 = "_-UP" (String#10470, DoABC#4)
// _SafeStr_1654 = "_-91u" (String#33055, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_4706 = "_-Fj" (String#9006, DoABC#4)
// _SafeStr_4707 = "_-F1z" (String#12919, DoABC#4)


