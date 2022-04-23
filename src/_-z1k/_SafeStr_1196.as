// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-z1k._SafeStr_1196

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1196 implements IMessageParser 
    {

        private var _SafeStr_7007:int;
        private var _location:String;


        public function get itemId():int
        {
            return (_SafeStr_7007);
        }

        public function get location():String
        {
            return (_location);
        }

        public function flush():Boolean
        {
            _SafeStr_7007 = -1;
            _location = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_7007 = _arg_1.readInteger();
            _location = _arg_1.readString();
            return (true);
        }


    }
}//package _-z1k

// _SafeStr_1196 = "_-kf" (String#9709, DoABC#3)
// _SafeStr_7007 = "_-J1n" (String#7783, DoABC#3)


