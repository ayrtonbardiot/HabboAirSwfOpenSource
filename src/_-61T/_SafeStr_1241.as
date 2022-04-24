// by nota

//_-61T._SafeStr_1241

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Ol._SafeStr_1643;
    import _-Ol._SafeStr_1602;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1241 implements IMessageParser 
    {

        private var _users:Array = [];


        public function get userUpdateCount():int
        {
            return (_users.length);
        }

        public function flush():Boolean
        {
            _users = [];
            return (true);
        }

        public function getUserUpdateData(_arg_1:int):_SafeStr_1643
        {
            if (((_arg_1 < 0) || (_arg_1 >= userUpdateCount)))
            {
                return (null);
            };
            return (_users[_arg_1]);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_21:int;
            var _local_14:int;
            var _local_26:Number;
            var _local_27:Number;
            var _local_28:Number;
            var _local_12:Number;
            var _local_2:int;
            var _local_24:int;
            var _local_8:* = null;
            var _local_9:Boolean;
            var _local_15:int;
            var _local_7:int;
            var _local_29:* = null;
            var _local_19:Number;
            var _local_18:Number;
            var _local_17:Number;
            var _local_10:Boolean;
            var _local_11:* = null;
            var _local_22:int;
            var _local_5:* = null;
            var _local_13:* = null;
            var _local_25:* = null;
            var _local_16:* = null;
            var _local_3:* = null;
            var _local_23:Number;
            var _local_6:Number;
            var _local_4:* = null;
            if (_arg_1 == null)
            {
                return (false);
            };
            var _local_20:int = _arg_1.readInteger();
            _local_21 = 0;
            while (_local_21 < _local_20)
            {
                _local_14 = _arg_1.readInteger();
                _local_26 = _arg_1.readInteger();
                _local_27 = _arg_1.readInteger();
                _local_28 = _arg_1.readString();
                _local_12 = 0;
                _local_2 = _arg_1.readInteger();
                _local_24 = _arg_1.readInteger();
                _local_8 = _arg_1.readString();
                _local_9 = false;
                _local_15 = ((_local_2 % 8) * 45);
                _local_7 = ((_local_24 % 8) * 45);
                _local_29 = [];
                _local_19 = 0;
                _local_18 = 0;
                _local_17 = 0;
                _local_10 = false;
                _local_11 = _local_8.split("/");
                _local_22 = 0;
                while (_local_22 < _local_11.length)
                {
                    _local_5 = (_local_11[_local_22] as String);
                    _local_13 = _local_5.split(" ");
                    _local_25 = String(_local_13[0]);
                    _local_16 = "";
                    if (_local_25 != "")
                    {
                        if (_local_13.length >= 2)
                        {
                            _local_16 = String(_local_13[1]);
                            switch (_local_25)
                            {
                                case "mv":
                                    _local_3 = _local_16.split(",");
                                    if (_local_3.length >= 3)
                                    {
                                        _local_19 = _local_3[0];
                                        _local_18 = _local_3[1];
                                        _local_17 = _local_3[2];
                                        _local_10 = true;
                                    };
                                    break;
                                case "sit":
                                    _local_23 = _local_16;
                                    if (_local_13.length >= 3)
                                    {
                                        _local_9 = (_local_13[2] == "1");
                                    };
                                    _local_12 = _local_23;
                                    break;
                                case "lay":
                                    _local_6 = _local_16;
                                    if (_local_6 < 0)
                                    {
                                    };
                                    _local_12 = Math.abs(_local_6);
                            };
                        };
                        _local_29.push(new _SafeStr_1602(_local_25, _local_16));
                    };
                    _local_22++;
                };
                _local_4 = new _SafeStr_1643(_local_14, _local_26, _local_27, _local_28, _local_12, _local_7, _local_15, _local_19, _local_18, _local_17, _local_10, _local_9, _local_29);
                _users.push(_local_4);
                _local_21++;
            };
            return (true);
        }


    }
}//package _-61T

// _SafeStr_1241 = "_-7r" (String#7060, DoABC#3)
// _SafeStr_1602 = "_-vw" (String#10431, DoABC#3)
// _SafeStr_1643 = "_-5D" (String#6907, DoABC#3)


