// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-3D._SafeStr_1094

package _-3D
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1094 implements IMessageParser 
    {

        private var _SafeStr_7064:String;


        public function flush():Boolean
        {
            _SafeStr_7064 = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7064 = _arg_1.readString();
            return (true);
        }

        public function get imageUri():String
        {
            return (_SafeStr_7064);
        }


    }
}//package _-3D

// _SafeStr_1094 = "_-aM" (String#9015, DoABC#3)
// _SafeStr_7064 = "_-nH" (String#9898, DoABC#3)


