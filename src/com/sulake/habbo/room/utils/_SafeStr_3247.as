// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.utils._SafeStr_3247

package com.sulake.habbo.room.utils
{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.room.utils.IVector3d;

    [SecureSWF(rename="true")]
    public class _SafeStr_3247 
    {

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_4042:int = 0;
        private var _SafeStr_4028:String = null;
        private var _SafeStr_3985:Vector3d = new Vector3d();
        private var _SafeStr_4049:Vector3d = new Vector3d();
        private var _SafeStr_3734:int = 0;
        private var _SafeStr_3740:IStuffData = null;
        private var _SafeStr_4268:Number = NaN;
        private var _expiryTime:int = -1;
        private var _SafeStr_5225:int = 0;
        private var _SafeStr_5226:int = 0;
        private var _ownerName:String = "";
        private var _SafeStr_5227:Boolean = true;
        private var _realRoomObject:Boolean = true;
        private var _SafeStr_3990:Number;

        public function _SafeStr_3247(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:IStuffData, _arg_8:Number=NaN, _arg_9:int=-1, _arg_10:int=0, _arg_11:int=0, _arg_12:String="", _arg_13:Boolean=true, _arg_14:Boolean=true, _arg_15:Number=-1)
        {
            _SafeStr_3820 = _arg_1;
            _SafeStr_4042 = _arg_2;
            _SafeStr_4028 = _arg_3;
            _SafeStr_3985.assign(_arg_4);
            _SafeStr_4049.assign(_arg_5);
            _SafeStr_3734 = _arg_6;
            _SafeStr_3740 = _arg_7;
            _SafeStr_4268 = _arg_8;
            _expiryTime = _arg_9;
            _SafeStr_5225 = _arg_10;
            _SafeStr_5226 = _arg_11;
            _ownerName = _arg_12;
            _SafeStr_5227 = _arg_13;
            _realRoomObject = _arg_14;
            _SafeStr_3990 = _arg_15;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get typeId():int
        {
            return (_SafeStr_4042);
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get loc():IVector3d
        {
            return (_SafeStr_3985);
        }

        public function get dir():IVector3d
        {
            return (_SafeStr_4049);
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function get data():IStuffData
        {
            return (_SafeStr_3740);
        }

        public function get extra():Number
        {
            return (_SafeStr_4268);
        }

        public function get expiryTime():int
        {
            return (_expiryTime);
        }

        public function get usagePolicy():int
        {
            return (_SafeStr_5225);
        }

        public function get ownerId():int
        {
            return (_SafeStr_5226);
        }

        public function get ownerName():String
        {
            return (_ownerName);
        }

        public function get synchronized():Boolean
        {
            return (_SafeStr_5227);
        }

        public function get realRoomObject():Boolean
        {
            return (_realRoomObject);
        }

        public function get sizeZ():Number
        {
            return (_SafeStr_3990);
        }


    }
}//package com.sulake.habbo.room.utils

// _SafeStr_3247 = "_-o19" (String#3004, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_3985 = "_-Bg" (String#992, DoABC#4)
// _SafeStr_3990 = "_-q1l" (String#6574, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4042 = "_-L1L" (String#4000, DoABC#4)
// _SafeStr_4049 = "_-W12" (String#2181, DoABC#4)
// _SafeStr_4268 = "_-8L" (String#3669, DoABC#4)
// _SafeStr_5225 = "_-2X" (String#8854, DoABC#4)
// _SafeStr_5226 = "_-Ld" (String#2223, DoABC#4)
// _SafeStr_5227 = "_-xj" (String#18559, DoABC#4)


