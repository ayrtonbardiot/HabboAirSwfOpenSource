// by nota

//_-AE._SafeStr_1619

package _-AE
{
    import __AS3__.vec.Vector;
    import flash.utils.getTimer;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1619 
    {

        protected var _SafeStr_3820:int;
        protected var _SafeStr_6199:String;
        protected var _SafeStr_4028:int;
        protected var _SafeStr_4004:String;
        protected var _description:String;
        protected var _SafeStr_4295:String;
        protected var _SafeStr_7169:String;
        protected var _SafeStr_4838:String;
        protected var _SafeStr_7170:int;
        protected var _expirationTime:uint;
        protected var _SafeStr_4262:int;
        protected var _SafeStr_4260:int;
        protected var _SafeStr_4261:int;
        protected var _SafeStr_5971:Vector.<String>;
        protected var _SafeStr_6200:int;

        public function _SafeStr_1619(_arg_1:_SafeStr_1619=null)
        {
            if (_arg_1 != null)
            {
                _SafeStr_3820 = _arg_1.id;
                _SafeStr_6199 = _arg_1.identifier;
                _SafeStr_4028 = _arg_1.type;
                _SafeStr_4004 = _arg_1.title;
                _description = _arg_1.description;
                _SafeStr_4295 = _arg_1.imageUrl;
                _SafeStr_7169 = _arg_1.iconImageUrl;
                _SafeStr_4838 = _arg_1.productCode;
                _SafeStr_7170 = _arg_1.purchaseLimit;
                _expirationTime = _arg_1.expirationTime;
                _SafeStr_4262 = _arg_1.priceInCredits;
                _SafeStr_4260 = _arg_1.priceInActivityPoints;
                _SafeStr_4261 = _arg_1.activityPointType;
                _SafeStr_5971 = _arg_1.subProductCodes;
                _SafeStr_6200 = _arg_1.trackingState;
            };
        }

        public function parse(_arg_1:IMessageDataWrapper):_SafeStr_1619
        {
            var _local_3:int;
            _SafeStr_6200 = _arg_1.readInteger();
            _SafeStr_3820 = _arg_1.readInteger();
            _SafeStr_6199 = _arg_1.readString();
            _SafeStr_4838 = _arg_1.readString();
            _SafeStr_4262 = _arg_1.readInteger();
            _SafeStr_4260 = _arg_1.readInteger();
            _SafeStr_4261 = _arg_1.readInteger();
            _SafeStr_7170 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _expirationTime = ((_local_2 > 0) ? ((_local_2 * 1000) + getTimer()) : 0);
            _SafeStr_4004 = _arg_1.readString();
            _description = _arg_1.readString();
            _SafeStr_4295 = _arg_1.readString();
            _SafeStr_7169 = _arg_1.readString();
            _SafeStr_4028 = _arg_1.readInteger();
            _SafeStr_5971 = new Vector.<String>(0);
            var _local_4:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_4)
            {
                _SafeStr_5971.push(_arg_1.readString());
                _local_3++;
            };
            return (this);
        }

        public function purchased(_arg_1:int):void
        {
            _SafeStr_7170 = (_SafeStr_7170 - _arg_1);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get identifier():String
        {
            return (_SafeStr_6199);
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function get title():String
        {
            return (_SafeStr_4004);
        }

        public function get description():String
        {
            return (_description);
        }

        public function get imageUrl():String
        {
            return (_SafeStr_4295);
        }

        public function get iconImageUrl():String
        {
            return (_SafeStr_7169);
        }

        public function get productCode():String
        {
            return (_SafeStr_4838);
        }

        public function get purchaseLimit():int
        {
            return (_SafeStr_7170);
        }

        public function get expirationTime():int
        {
            return (_expirationTime);
        }

        public function get priceInCredits():int
        {
            return (_SafeStr_4262);
        }

        public function get priceInActivityPoints():int
        {
            return (_SafeStr_4260);
        }

        public function get activityPointType():int
        {
            return (_SafeStr_4261);
        }

        public function get subProductCodes():Vector.<String>
        {
            return (_SafeStr_5971);
        }

        public function get trackingState():int
        {
            return (_SafeStr_6200);
        }


    }
}//package _-AE

// _SafeStr_1619 = "_-12w" (String#6587, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_4004 = "_-41o" (String#6832, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_4260 = "_-V1Z" (String#8622, DoABC#3)
// _SafeStr_4261 = "_-m1a" (String#9806, DoABC#3)
// _SafeStr_4262 = "_-qJ" (String#10076, DoABC#3)
// _SafeStr_4295 = "_-GL" (String#7628, DoABC#3)
// _SafeStr_4838 = "_-T1g" (String#8487, DoABC#3)
// _SafeStr_5971 = "_-71n" (String#7027, DoABC#3)
// _SafeStr_6199 = "_-z1d" (String#10668, DoABC#3)
// _SafeStr_6200 = "_-EX" (String#7511, DoABC#3)
// _SafeStr_7169 = "_-sX" (String#10224, DoABC#3)
// _SafeStr_7170 = "_-ye" (String#10642, DoABC#3)


