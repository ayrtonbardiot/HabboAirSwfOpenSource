// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.DefaultElement

package com.sulake.habbo.roomevents.userdefinedroomevents
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import _-l12._SafeStr_1554;

    public class DefaultElement implements _SafeStr_3285 
    {


        public function get code():int
        {
            return (-1);
        }

        public function get negativeCode():int
        {
            return (-1);
        }

        public function get requiresFurni():int
        {
            return (UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_NONE);
        }

        public function get hasStateSnapshot():Boolean
        {
            return (false);
        }

        public function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array
        {
            return ([]);
        }

        public function readStringParamFromForm(_arg_1:_SafeStr_3133):String
        {
            return ("");
        }

        public function onInit(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):void
        {
        }

        public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
        }

        public function get hasSpecialInputs():Boolean
        {
            return (false);
        }

        public function validate(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):String
        {
            return (null);
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3285 = "_-j1k" (String#3139, DoABC#4)


