// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-PB._SafeStr_1359

package _-PB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1359 implements IMessageParser 
    {

        private var _SafeStr_7496:int;
        private var _SafeStr_7497:int;


        public function get requiredDays():int
        {
            return (_SafeStr_7496);
        }

        public function get avatarAgeInDays():int
        {
            return (_SafeStr_7497);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7496 = _arg_1.readInteger();
            _SafeStr_7497 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-PB

// _SafeStr_1359 = "_-gP" (String#9425, DoABC#3)
// _SafeStr_7496 = "_-12t" (String#6585, DoABC#3)
// _SafeStr_7497 = "_-u1W" (String#10317, DoABC#3)


