// by nota

//_-Wi._SafeStr_1645

package _-Wi
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1645 extends _SafeStr_1644 
    {

        private var _SafeStr_6018:int;
        private var _SafeStr_6019:int;
        private var _SafeStr_6020:int;
        private var _SafeStr_6021:int;
        private var _SafeStr_7728:String;
        private var _SafeStr_7729:String;
        private var _SafeStr_7730:String;
        private var _SafeStr_7731:String;
        private var _SafeStr_7732:String;
        private var _SafeStr_7733:Boolean;
        private var _SafeStr_7734:Boolean;


        public static function readFromMessage(_arg_1:IMessageDataWrapper):_SafeStr_1645
        {
            var _local_2:_SafeStr_1645 = new (_SafeStr_1645)();
            _SafeStr_1644.fillFromMessage(_local_2, _arg_1);
            _local_2._SafeStr_6018 = _arg_1.readInteger();
            _local_2._SafeStr_6019 = _arg_1.readInteger();
            _local_2._SafeStr_6020 = _arg_1.readInteger();
            _local_2._SafeStr_6021 = _arg_1.readInteger();
            _local_2._SafeStr_7728 = _arg_1.readString();
            _local_2._SafeStr_7729 = _arg_1.readString();
            _local_2._SafeStr_7730 = _arg_1.readString();
            _local_2._SafeStr_7731 = _arg_1.readString();
            _local_2._SafeStr_7732 = _arg_1.readString();
            _local_2._SafeStr_7733 = _arg_1.readBoolean();
            _local_2._SafeStr_7734 = _arg_1.readBoolean();
            return (_local_2);
        }


        public function get readPermissions():int
        {
            return (_SafeStr_6018);
        }

        public function get postMessagePermissions():int
        {
            return (_SafeStr_6019);
        }

        public function get postThreadPermissions():int
        {
            return (_SafeStr_6020);
        }

        public function get moderatePermissions():int
        {
            return (_SafeStr_6021);
        }

        public function get canRead():Boolean
        {
            return (_SafeStr_7728.length == 0);
        }

        public function get canReport():Boolean
        {
            return (true);
        }

        public function get canPostMessage():Boolean
        {
            return (_SafeStr_7729.length == 0);
        }

        public function get canPostThread():Boolean
        {
            return (_SafeStr_7730.length == 0);
        }

        public function get canModerate():Boolean
        {
            return (_SafeStr_7731.length == 0);
        }

        public function get canChangeSettings():Boolean
        {
            return (_SafeStr_7733);
        }

        public function get isStaff():Boolean
        {
            return (_SafeStr_7734);
        }

        public function get readPermissionError():String
        {
            return (_SafeStr_7728);
        }

        public function get postMessagePermissionError():String
        {
            return (_SafeStr_7729);
        }

        public function get postThreadPermissionError():String
        {
            return (_SafeStr_7730);
        }

        public function get moderatePermissionError():String
        {
            return (_SafeStr_7731);
        }

        public function get reportPermissionError():String
        {
            return (_SafeStr_7732);
        }


    }
}//package _-Wi

// _SafeStr_1644 = "_-mW" (String#9832, DoABC#3)
// _SafeStr_1645 = "_-oc" (String#9956, DoABC#3)
// _SafeStr_6018 = "_-mt" (String#9844, DoABC#3)
// _SafeStr_6019 = "_-b1J" (String#9047, DoABC#3)
// _SafeStr_6020 = "_-V1b" (String#8623, DoABC#3)
// _SafeStr_6021 = "_-i11" (String#9516, DoABC#3)
// _SafeStr_7728 = "_-F1W" (String#7544, DoABC#3)
// _SafeStr_7729 = "_-s1J" (String#10182, DoABC#3)
// _SafeStr_7730 = "_-Q3" (String#8308, DoABC#3)
// _SafeStr_7731 = "_-Q6" (String#8311, DoABC#3)
// _SafeStr_7732 = "_-L13" (String#7930, DoABC#3)
// _SafeStr_7733 = "_-vp" (String#10426, DoABC#3)
// _SafeStr_7734 = "_-TF" (String#8512, DoABC#3)


