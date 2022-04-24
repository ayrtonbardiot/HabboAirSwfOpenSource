// by nota

//_-Ja._SafeStr_1574

package _-Ja
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1574 implements _SafeStr_13 
    {

        private var _SafeStr_7303:int;
        private var _SafeStr_7304:int;
        private var _SafeStr_7305:String;
        private var _flatId:int;
        private var _SafeStr_4674:int;
        private var _SafeStr_7306:int;
        private var _SafeStr_7307:String;
        private var _SafeStr_7308:String;
        private var _creationTime:String;
        private var _SafeStr_7309:Date;
        private var _disposed:Boolean;

        public function _SafeStr_1574(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_7303 = _arg_1.readInteger();
            _SafeStr_7304 = _arg_1.readInteger();
            _SafeStr_7305 = _arg_1.readString();
            _flatId = _arg_1.readInteger();
            _SafeStr_7306 = _arg_1.readInteger();
            _SafeStr_7307 = _arg_1.readString();
            _SafeStr_7308 = _arg_1.readString();
            var _local_8:int = _arg_1.readInteger();
            var _local_5:int = _arg_1.readInteger();
            var _local_9:Date = new Date();
            var _local_3:Number = _local_9.getTime();
            var _local_2:Number = ((_local_8 * 60) * 1000);
            _local_3 = (_local_3 - _local_2);
            var _local_6:Date = new Date(_local_3);
            _creationTime = ((((((((_local_6.date + "-") + _local_6.month) + "-") + _local_6.fullYear) + " ") + _local_6.hours) + ":") + _local_6.minutes);
            var _local_7:Number = _local_9.getTime();
            var _local_4:Number = ((_local_5 * 60) * 1000);
            _local_7 = (_local_7 + _local_4);
            _SafeStr_7309 = new Date(_local_7);
            _SafeStr_4674 = _arg_1.readInteger();
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get adId():int
        {
            return (_SafeStr_7303);
        }

        public function get ownerAvatarId():int
        {
            return (_SafeStr_7304);
        }

        public function get ownerAvatarName():String
        {
            return (_SafeStr_7305);
        }

        public function get flatId():int
        {
            return (_flatId);
        }

        public function get categoryId():int
        {
            return (_SafeStr_4674);
        }

        public function get eventType():int
        {
            return (_SafeStr_7306);
        }

        public function get eventName():String
        {
            return (_SafeStr_7307);
        }

        public function get eventDescription():String
        {
            return (_SafeStr_7308);
        }

        public function get creationTime():String
        {
            return (_creationTime);
        }

        public function get expirationDate():Date
        {
            return (_SafeStr_7309);
        }


    }
}//package _-Ja

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1574 = "_-e1X" (String#9276, DoABC#3)
// _SafeStr_4674 = "_-k10" (String#9658, DoABC#3)
// _SafeStr_7303 = "_-C1Y" (String#7364, DoABC#3)
// _SafeStr_7304 = "_-5J" (String#6912, DoABC#3)
// _SafeStr_7305 = "_-K1M" (String#7871, DoABC#3)
// _SafeStr_7306 = "_-p1s" (String#9999, DoABC#3)
// _SafeStr_7307 = "_-N1v" (String#8080, DoABC#3)
// _SafeStr_7308 = "_-F1X" (String#7545, DoABC#3)
// _SafeStr_7309 = "_-O1Y" (String#8147, DoABC#3)


