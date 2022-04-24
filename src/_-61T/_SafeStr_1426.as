// by nota

//_-61T._SafeStr_1426

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Ol._SafeStr_1584;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1426 implements IMessageParser 
    {

        private var _SafeStr_3820:int;
        private var _SafeStr_7112:Array;
        private var _SafeStr_5586:_SafeStr_1584 = null;


        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get avatar():_SafeStr_1584
        {
            return (_SafeStr_5586);
        }

        public function get objectList():Array
        {
            return (_SafeStr_7112);
        }

        public function flush():Boolean
        {
            _SafeStr_3820 = -1;
            _SafeStr_5586 = null;
            _SafeStr_7112 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_14:int;
            var _local_7:* = null;
            var _local_2:* = null;
            var _local_9:* = null;
            var _local_12:Number;
            var _local_3:Number;
            var _local_6:int;
            if (_arg_1 == null)
            {
                return (false);
            };
            var _local_10:Number = _arg_1.readInteger();
            var _local_11:Number = _arg_1.readInteger();
            var _local_5:Number = _arg_1.readInteger();
            var _local_4:Number = _arg_1.readInteger();
            var _local_8:int = _arg_1.readInteger();
            _SafeStr_7112 = [];
            _local_6 = 0;
            while (_local_6 < _local_8)
            {
                _local_14 = _arg_1.readInteger();
                _local_12 = _arg_1.readString();
                _local_3 = _arg_1.readString();
                _local_2 = new Vector3d(_local_10, _local_11, _local_12);
                _local_9 = new Vector3d(_local_5, _local_4, _local_3);
                _local_7 = new _SafeStr_1584(_local_14, _local_2, _local_9);
                _SafeStr_7112.push(_local_7);
                _local_6++;
            };
            _SafeStr_3820 = _arg_1.readInteger();
            if (!_arg_1.bytesAvailable)
            {
                return (true);
            };
            var _local_13:int = _arg_1.readInteger();
            switch (_local_13)
            {
                case 0:
                    break;
                case 1:
                    _local_14 = _arg_1.readInteger();
                    _local_12 = _arg_1.readString();
                    _local_3 = _arg_1.readString();
                    _local_2 = new Vector3d(_local_10, _local_11, _local_12);
                    _local_9 = new Vector3d(_local_5, _local_4, _local_3);
                    _SafeStr_5586 = new _SafeStr_1584(_local_14, _local_2, _local_9, "mv");
                    break;
                case 2:
                    _local_14 = _arg_1.readInteger();
                    _local_12 = _arg_1.readString();
                    _local_3 = _arg_1.readString();
                    _local_2 = new Vector3d(_local_10, _local_11, _local_12);
                    _local_9 = new Vector3d(_local_5, _local_4, _local_3);
                    _SafeStr_5586 = new _SafeStr_1584(_local_14, _local_2, _local_9, "sld");
                    break;
                default:
                    _SafeStr_14.log("** Incompatible character movetype!");
            };
            return (true);
        }


    }
}//package _-61T

// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_1426 = "_-m1J" (String#9799, DoABC#3)
// _SafeStr_1584 = "_-a7" (String#9007, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_5586 = "_-d1n" (String#9222, DoABC#3)
// _SafeStr_7112 = "_-v1I" (String#10383, DoABC#3)


