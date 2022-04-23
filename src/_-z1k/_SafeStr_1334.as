// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Z1K._SafeStr_1334

package _-Z1K
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1334 implements IMessageParser 
    {

        private var _isOpen:Boolean;
        private var _SafeStr_7889:int;


        public function get isOpen():Boolean
        {
            return (_isOpen);
        }

        public function get minutesUntilChange():int
        {
            return (_SafeStr_7889);
        }

        public function flush():Boolean
        {
            _isOpen = false;
            _SafeStr_7889 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _isOpen = (_arg_1.readInteger() > 0);
            _SafeStr_7889 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-Z1K

// _SafeStr_1334 = "_-gb" (String#9430, DoABC#3)
// _SafeStr_7889 = "_-In" (String#7758, DoABC#3)


