// by nota

//com.sulake.habbo.room.utils._SafeStr_3172

package com.sulake.habbo.room.utils
{
    import com.sulake.habbo.room.ISelectedRoomObjectData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.room.utils.IVector3d;

    [SecureSWF(rename="true")]
    public class _SafeStr_3172 implements ISelectedRoomObjectData 
    {

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_4158:int = 0;
        private var _operation:String = "";
        private var _SafeStr_3985:Vector3d = null;
        private var _SafeStr_4049:Vector3d = null;
        private var _SafeStr_4042:int = 0;
        private var _SafeStr_4524:String = null;
        private var _SafeStr_4601:IStuffData = null;
        private var _SafeStr_3734:int = -1;
        private var _animFrame:int = -1;
        private var _SafeStr_4375:String = null;

        public function _SafeStr_3172(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int=0, _arg_7:String=null, _arg_8:IStuffData=null, _arg_9:int=-1, _arg_10:int=-1, _arg_11:String=null)
        {
            _SafeStr_3820 = _arg_1;
            _SafeStr_4158 = _arg_2;
            _operation = _arg_3;
            _SafeStr_3985 = new Vector3d();
            _SafeStr_3985.assign(_arg_4);
            _SafeStr_4049 = new Vector3d();
            _SafeStr_4049.assign(_arg_5);
            _SafeStr_4042 = _arg_6;
            _SafeStr_4524 = _arg_7;
            _SafeStr_4601 = _arg_8;
            _SafeStr_3734 = _arg_9;
            _animFrame = _arg_10;
            _SafeStr_4375 = _arg_11;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get category():int
        {
            return (_SafeStr_4158);
        }

        public function get operation():String
        {
            return (_operation);
        }

        public function get loc():Vector3d
        {
            return (_SafeStr_3985);
        }

        public function get dir():Vector3d
        {
            return (_SafeStr_4049);
        }

        public function get typeId():int
        {
            return (_SafeStr_4042);
        }

        public function get instanceData():String
        {
            return (_SafeStr_4524);
        }

        public function get stuffData():IStuffData
        {
            return (_SafeStr_4601);
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function get animFrame():int
        {
            return (_animFrame);
        }

        public function get posture():String
        {
            return (_SafeStr_4375);
        }

        public function dispose():void
        {
            _SafeStr_3985 = null;
            _SafeStr_4049 = null;
        }


    }
}//package com.sulake.habbo.room.utils

// _SafeStr_3172 = "_-eb" (String#2240, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_3985 = "_-Bg" (String#992, DoABC#4)
// _SafeStr_4042 = "_-L1L" (String#4000, DoABC#4)
// _SafeStr_4049 = "_-W12" (String#2181, DoABC#4)
// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)
// _SafeStr_4375 = "_-Q2" (String#2723, DoABC#4)
// _SafeStr_4524 = "_-M1P" (String#8796, DoABC#4)
// _SafeStr_4601 = "_-o1B" (String#1746, DoABC#4)


