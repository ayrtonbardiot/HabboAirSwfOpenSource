// by nota

//_-z1k._SafeStr_1296

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1296 implements IMessageParser 
    {

        private var _SafeStr_5717:Boolean;
        private var _furniTypeName:String;
        private var _SafeStr_7873:Boolean;
        private var _SafeStr_4262:int;
        private var _SafeStr_4260:int;
        private var _SafeStr_4261:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5717 = _arg_1.readBoolean();
            _furniTypeName = _arg_1.readString();
            _SafeStr_7873 = _arg_1.readBoolean();
            _SafeStr_4262 = _arg_1.readInteger();
            _SafeStr_4260 = _arg_1.readInteger();
            _SafeStr_4261 = _arg_1.readInteger();
            return (true);
        }

        public function get isWallItem():Boolean
        {
            return (_SafeStr_5717);
        }

        public function get furniTypeName():String
        {
            return (_furniTypeName);
        }

        public function get buyout():Boolean
        {
            return (_SafeStr_7873);
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


    }
}//package _-z1k

// _SafeStr_1296 = "_-V1W" (String#8619, DoABC#3)
// _SafeStr_4260 = "_-V1Z" (String#8622, DoABC#3)
// _SafeStr_4261 = "_-m1a" (String#9806, DoABC#3)
// _SafeStr_4262 = "_-qJ" (String#10076, DoABC#3)
// _SafeStr_5717 = "_-cq" (String#9159, DoABC#3)
// _SafeStr_7873 = "_-R1K" (String#8343, DoABC#3)


