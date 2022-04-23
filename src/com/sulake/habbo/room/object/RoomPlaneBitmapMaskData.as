// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.RoomPlaneBitmapMaskData

package com.sulake.habbo.room.object
{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;

    public class RoomPlaneBitmapMaskData 
    {

        public static const MASK_CATEGORY_WINDOW:String = "window";
        public static const MASK_CATEGORY_HOLE:String = "hole";

        private var _SafeStr_3985:Vector3d = null;
        private var _SafeStr_4028:String = null;
        private var _SafeStr_4158:String = null;

        public function RoomPlaneBitmapMaskData(_arg_1:String, _arg_2:IVector3d, _arg_3:String)
        {
            this.type = _arg_1;
            this.loc = _arg_2;
            this.category = _arg_3;
        }

        public function get loc():IVector3d
        {
            return (_SafeStr_3985);
        }

        public function set loc(_arg_1:IVector3d):void
        {
            if (_SafeStr_3985 == null)
            {
                _SafeStr_3985 = new Vector3d();
            };
            _SafeStr_3985.assign(_arg_1);
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function set type(_arg_1:String):void
        {
            _SafeStr_4028 = _arg_1;
        }

        public function get category():String
        {
            return (_SafeStr_4158);
        }

        public function set category(_arg_1:String):void
        {
            _SafeStr_4158 = _arg_1;
        }

        public function dispose():void
        {
            _SafeStr_3985 = null;
        }


    }
}//package com.sulake.habbo.room.object

// _SafeStr_3985 = "_-Bg" (String#992, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)


