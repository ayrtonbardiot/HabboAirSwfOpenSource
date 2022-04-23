// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetPetPackageUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    import flash.display.BitmapData;

    public class RoomWidgetPetPackageUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const _SafeStr_8998:String = "RWOPPUE_OPEN_PET_PACKAGE_REQUESTED";
        public static const OPEN_PET_PACKAGE_RESULT:String = "RWOPPUE_OPEN_PET_PACKAGE_RESULT";
        public static const OPEN_PET_PACKAGE_UPDATE_PET_IMAGE:String = "RWOPPUE_OPEN_PET_PACKAGE_UPDATE_PET_IMAGE";

        private var _SafeStr_4157:int = -1;
        private var _SafeStr_4042:int = -1;
        private var _SafeStr_4204:BitmapData = null;
        private var _nameValidationStatus:int = 0;
        private var _nameValidationInfo:String = null;

        public function RoomWidgetPetPackageUpdateEvent(_arg_1:String, _arg_2:int, _arg_3:BitmapData, _arg_4:int, _arg_5:String, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(_arg_1, _arg_7, _arg_8);
            _SafeStr_4157 = _arg_2;
            _SafeStr_4204 = _arg_3;
            _nameValidationStatus = _arg_4;
            _nameValidationInfo = _arg_5;
            _SafeStr_4042 = _arg_6;
        }

        public function get nameValidationStatus():int
        {
            return (_nameValidationStatus);
        }

        public function get nameValidationInfo():String
        {
            return (_nameValidationInfo);
        }

        public function get image():BitmapData
        {
            return (_SafeStr_4204);
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get typeId():int
        {
            return (_SafeStr_4042);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4042 = "_-L1L" (String#4000, DoABC#4)
// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)
// _SafeStr_8998 = "_-124" (String#35235, DoABC#4)


