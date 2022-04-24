// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes._SafeStr_3448

package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.core.window._SafeStr_3133;
    import _-l12._SafeStr_1554;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.core.window.components.IRadioButtonWindow;

    public class _SafeStr_3448 extends DefaultActionType 
    {


        override public function get code():int
        {
            return (_SafeStr_3485.BOT_FOLLOW_AVATAR);
        }

        override public function get requiresFurni():int
        {
            return (UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_NONE);
        }

        override public function readStringParamFromForm(_arg_1:_SafeStr_3133):String
        {
            return (getInput(_arg_1, "bot_name").text);
        }

        override public function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array
        {
            return ([getSelector(_arg_1, "type_selector").getSelected().id]);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            getInput(_arg_1, "bot_name").text = _arg_2.stringParam;
            getSelector(_arg_1, "type_selector").setSelected(getRadio(_arg_1, ("radio_" + _arg_2.intParams[0])));
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getInput(_arg_1:_SafeStr_3133, _arg_2:String):ITextFieldWindow
        {
            return (ITextFieldWindow(_arg_1.findChildByName(_arg_2)));
        }

        private function getSelector(_arg_1:_SafeStr_3133, _arg_2:String):ISelectorWindow
        {
            return (ISelectorWindow(_arg_1.findChildByName(_arg_2)));
        }

        private function getRadio(_arg_1:_SafeStr_3133, _arg_2:String):IRadioButtonWindow
        {
            return (IRadioButtonWindow(_arg_1.findChildByName(_arg_2)));
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3448 = "_-Z11" (String#15352, DoABC#4)
// _SafeStr_3485 = "_-11s" (String#2865, DoABC#4)


