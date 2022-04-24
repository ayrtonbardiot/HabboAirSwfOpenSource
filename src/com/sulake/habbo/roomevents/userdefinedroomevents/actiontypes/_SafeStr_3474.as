// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes._SafeStr_3474

package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.core.window._SafeStr_3133;
    import _-l12._SafeStr_1554;
    import com.sulake.core.window.components.ITextFieldWindow;

    public class _SafeStr_3474 extends DefaultActionType 
    {


        override public function get code():int
        {
            return (_SafeStr_3485.BOT_TELEPORT);
        }

        override public function get requiresFurni():int
        {
            return (UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID);
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
}//package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3474 = "_-D1E" (String#14868, DoABC#4)
// _SafeStr_3485 = "_-11s" (String#2865, DoABC#4)


