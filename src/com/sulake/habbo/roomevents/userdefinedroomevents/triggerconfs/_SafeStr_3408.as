// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs._SafeStr_3408

package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
    import com.sulake.habbo.utils.FriendlyTime;
    import flash.events.Event;

    public class _SafeStr_3408 extends _SafeStr_3407 
    {


        override public function get code():int
        {
            return (_SafeStr_3412.PERIODIC_LONG);
        }

        override protected function onSliderChange(_arg_1:Event):void
        {
            var _local_2:* = null;
            var _local_4:Number;
            var _local_3:* = null;
            if (_arg_1.type == "change")
            {
                _local_2 = (_arg_1.target as SliderWindowController);
                if (_local_2)
                {
                    _local_4 = _local_2.getValue();
                    _local_3 = FriendlyTime.getFriendlyTime(roomEvents.localization, (_local_4 * 5));
                    roomEvents.localization.registerParameter("wiredfurni.params.setlongtime", "time", _local_3);
                };
            };
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs

// _SafeStr_3407 = "_-c1T" (String#10367, DoABC#4)
// _SafeStr_3408 = "_-1r" (String#15219, DoABC#4)
// _SafeStr_3412 = "_-k1K" (String#4209, DoABC#4)


