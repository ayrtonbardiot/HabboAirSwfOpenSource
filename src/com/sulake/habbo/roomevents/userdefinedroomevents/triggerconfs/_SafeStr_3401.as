// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs._SafeStr_3401

package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.core.window._SafeStr_3133;
    import _-l12._SafeStr_1554;
    import com.sulake.core.window.components.ITextFieldWindow;

    public class _SafeStr_3401 extends DefaultTriggerConf 
    {


        override public function get code():int
        {
            return (_SafeStr_3412.BOT_AVATAR_REACHED);
        }

        override public function get requiresFurni():int
        {
            return (UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_NONE);
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
            return (ITextFieldWindow(_arg_1.findChildByName("bot_name")));
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3401 = "_-eE" (String#15067, DoABC#4)
// _SafeStr_3412 = "_-k1K" (String#4209, DoABC#4)


