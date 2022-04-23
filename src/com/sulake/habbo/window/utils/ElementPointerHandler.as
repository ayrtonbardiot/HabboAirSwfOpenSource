// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.window.utils.ElementPointerHandler

package com.sulake.habbo.window.utils
{
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import _-EK._SafeStr_753;

    public class ElementPointerHandler 
    {

        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5011:_SafeStr_753;

        public function ElementPointerHandler(_arg_1:HabboWindowManagerComponent)
        {
            _windowManager = _arg_1;
            if (_windowManager.communication != null)
            {
                _SafeStr_5011 = new _SafeStr_753(onElementPointerMessage);
                _windowManager.communication.addHabboConnectionMessageEvent(_SafeStr_5011);
            };
        }

        private function onElementPointerMessage(_arg_1:_SafeStr_753):void
        {
            var _local_2:String = _arg_1.getParser().key;
            if (((_local_2 == null) || (_local_2 == "")))
            {
                _windowManager.hideHint();
            }
            else
            {
                _windowManager.showHint(_local_2);
            };
        }

        public function dispose():void
        {
            if (_windowManager.communication != null)
            {
                _windowManager.communication.removeHabboConnectionMessageEvent(_SafeStr_5011);
            };
            _windowManager = null;
        }


    }
}//package com.sulake.habbo.window.utils

// _SafeStr_5011 = "_-M1b" (String#15172, DoABC#4)
// _SafeStr_753 = "_-li" (String#18071, DoABC#4)


