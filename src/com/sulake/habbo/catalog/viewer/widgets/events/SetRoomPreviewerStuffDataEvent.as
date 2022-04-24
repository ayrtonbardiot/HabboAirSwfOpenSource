// by nota

//com.sulake.habbo.catalog.viewer.widgets.events.SetRoomPreviewerStuffDataEvent

package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;
    import com.sulake.habbo.room.IStuffData;

    public class SetRoomPreviewerStuffDataEvent extends Event 
    {

        private var _SafeStr_4601:IStuffData;

        public function SetRoomPreviewerStuffDataEvent(_arg_1:IStuffData, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super("CWE_SET_PREVIEWER_STUFFDATA", _arg_2, _arg_3);
            _SafeStr_4601 = _arg_1;
        }

        public function get stuffData():IStuffData
        {
            return (_SafeStr_4601);
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.events

// _SafeStr_4601 = "_-o1B" (String#1746, DoABC#4)


