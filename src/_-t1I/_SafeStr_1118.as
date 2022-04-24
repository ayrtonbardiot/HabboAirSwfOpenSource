// by nota

//_-t1I._SafeStr_1118

package _-t1I
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1118 implements IMessageParser 
    {

        private var _talentTrack:_SafeStr_1609;


        public function flush():Boolean
        {
            _talentTrack = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _talentTrack = new _SafeStr_1609();
            _talentTrack.parse(_arg_1);
            return (true);
        }

        public function getTalentTrack():_SafeStr_1609
        {
            return (_talentTrack);
        }


    }
}//package _-t1I

// _SafeStr_1118 = "_-2N" (String#6690, DoABC#3)
// _SafeStr_1609 = "_-g" (String#9382, DoABC#3)


