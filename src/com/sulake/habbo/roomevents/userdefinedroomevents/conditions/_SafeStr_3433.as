// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.roomevents.userdefinedroomevents.conditions._SafeStr_3433

package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;

    public class _SafeStr_3433 extends DefaultConditionType 
    {


        override public function get code():int
        {
            return (_SafeStr_3488.TRIGGERER_IS_ON_FURNI);
        }

        override public function get negativeCode():int
        {
            return (_SafeStr_3488.NOT_TRIGGERER_IS_ON_FURNI);
        }

        override public function get requiresFurni():int
        {
            return (UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID);
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.conditions

// _SafeStr_3433 = "_-I1b" (String#14424, DoABC#4)
// _SafeStr_3488 = "_-F6" (String#2812, DoABC#4)


