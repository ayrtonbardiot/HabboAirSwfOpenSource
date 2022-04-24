// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes._SafeStr_3409

package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;

    public class _SafeStr_3409 extends DefaultActionType 
    {


        override public function get code():int
        {
            return (_SafeStr_3485.CALL_ANOTHER_STACK);
        }

        override public function get requiresFurni():int
        {
            return (UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID);
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes

// _SafeStr_3409 = "_-Hf" (String#14371, DoABC#4)
// _SafeStr_3485 = "_-11s" (String#2865, DoABC#4)


