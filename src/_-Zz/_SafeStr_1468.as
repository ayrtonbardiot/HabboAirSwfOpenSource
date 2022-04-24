// by nota

//_-Zz._SafeStr_1468

package _-Zz
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1468 implements IMessageParser 
    {

        private var _SafeStr_6042:int;
        private var _SafeStr_5431:int;


        public function flush():Boolean
        {
            _SafeStr_5431 = -1;
            _SafeStr_6042 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5431 = _arg_1.readInteger();
            _SafeStr_6042 = _arg_1.readInteger();
            return (true);
        }

        public function get rarityCategory():int
        {
            return (_SafeStr_6042);
        }

        public function get petId():int
        {
            return (_SafeStr_5431);
        }


    }
}//package _-Zz

// _SafeStr_1468 = "_-jb" (String#9645, DoABC#3)
// _SafeStr_5431 = "_-GK" (String#7627, DoABC#3)
// _SafeStr_6042 = "_-xC" (String#10551, DoABC#3)


