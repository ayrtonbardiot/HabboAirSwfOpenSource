// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.conditions.FurnisHaveAvatars

package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;

    public class FurnisHaveAvatars extends DefaultConditionType 
    {


        override public function get code():int
        {
            return (_SafeStr_3488.FURNIS_HAVE_AVATARS);
        }

        override public function get negativeCode():int
        {
            return (_SafeStr_3488.NOT_FURNIS_HAVE_AVATARS);
        }

        override public function get requiresFurni():int
        {
            return (UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID);
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.conditions

// _SafeStr_3488 = "_-F6" (String#2812, DoABC#4)


