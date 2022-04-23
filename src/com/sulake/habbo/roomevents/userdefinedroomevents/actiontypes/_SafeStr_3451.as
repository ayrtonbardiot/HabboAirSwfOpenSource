﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes._SafeStr_3451

package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.core.window._SafeStr_3133;
    import _-l12._SafeStr_1554;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;

    public class _SafeStr_3451 extends DefaultActionType 
    {


        override public function get code():int
        {
            return (_SafeStr_3485.CHAT);
        }

        override public function readStringParamFromForm(_arg_1:_SafeStr_3133):String
        {
            return (getInput(_arg_1).text);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            getInput(_arg_1).text = _arg_2.stringParam;
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getInput(_arg_1:_SafeStr_3133):ITextFieldWindow
        {
            return (ITextFieldWindow(_arg_1.findChildByName("chat_message")));
        }

        override public function validate(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):String
        {
            var _local_4:* = null;
            var _local_3:int = 100;
            if (getInput(_arg_1).text.length > _local_3)
            {
                _local_4 = "wiredfurni.chatmsgtoolong";
                return (_arg_2.localization.getLocalization(_local_4, _local_4));
            };
            return (null);
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3451 = "_-G1y" (String#15404, DoABC#4)
// _SafeStr_3485 = "_-11s" (String#2865, DoABC#4)


