// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetPetFigureUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    import flash.display.BitmapData;

    public class RoomWidgetPetFigureUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const PET_FIGURE_UPDATE:String = "RWPIUE_PET_FIGURE_UPDATE";

        private var _SafeStr_5431:int;
        private var _SafeStr_4204:BitmapData;

        public function RoomWidgetPetFigureUpdateEvent(_arg_1:int, _arg_2:BitmapData, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super("RWPIUE_PET_FIGURE_UPDATE", _arg_3, _arg_4);
            _SafeStr_5431 = _arg_1;
            _SafeStr_4204 = _arg_2;
        }

        public function get petId():int
        {
            return (_SafeStr_5431);
        }

        public function get image():BitmapData
        {
            return (_SafeStr_4204);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)
// _SafeStr_5431 = "_-GK" (String#1818, DoABC#4)


