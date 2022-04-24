// by nota

//_-wm._SafeStr_1097

package _-wm
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-JS._SafeStr_1545;
    import _-JS._SafeStr_1600;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1097 implements IMessageParser 
    {

        private var _SafeStr_7737:Array;
        private var _SafeStr_7738:Array;
        private var _SafeStr_7739:Array;
        private var _SafeStr_7740:Array;


        public function flush():Boolean
        {
            this._SafeStr_7737 = [];
            this._SafeStr_7738 = [];
            this._SafeStr_7739 = [];
            this._SafeStr_7740 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_5:int;
            var _local_6:int;
            var _local_4:int;
            var _local_2:int = _arg_1.readInteger();
            _local_5 = 0;
            while (_local_5 < _local_2)
            {
                this._SafeStr_7737.push(new _SafeStr_1545(_arg_1));
                _local_5++;
            };
            var _local_3:int = _arg_1.readInteger();
            _local_5 = 0;
            while (_local_5 < _local_3)
            {
                _local_6 = _arg_1.readInteger();
                if (_local_6 == -1)
                {
                    _local_4 = _arg_1.readInteger();
                    this._SafeStr_7738.push(_local_4);
                }
                else
                {
                    if (_local_6 == 0)
                    {
                        this._SafeStr_7740.push(new _SafeStr_1600(_arg_1));
                    }
                    else
                    {
                        if (_local_6 == 1)
                        {
                            this._SafeStr_7739.push(new _SafeStr_1600(_arg_1));
                        };
                    };
                };
                _local_5++;
            };
            return (true);
        }

        public function get cats():Array
        {
            return (this._SafeStr_7737);
        }

        public function get removedFriendIds():Array
        {
            return (this._SafeStr_7738);
        }

        public function get addedFriends():Array
        {
            return (this._SafeStr_7739);
        }

        public function get updatedFriends():Array
        {
            return (this._SafeStr_7740);
        }


    }
}//package _-wm

// _SafeStr_1097 = "_-RI" (String#8371, DoABC#3)
// _SafeStr_1545 = "_-h1b" (String#9474, DoABC#3)
// _SafeStr_1600 = "_-Cu" (String#7407, DoABC#3)
// _SafeStr_7737 = "_-ZS" (String#8940, DoABC#3)
// _SafeStr_7738 = "_-m1A" (String#9795, DoABC#3)
// _SafeStr_7739 = "_-O1" (String#8128, DoABC#3)
// _SafeStr_7740 = "_-91N" (String#7164, DoABC#3)


