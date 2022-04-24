// by nota

//_-uX._SafeStr_1431

package _-uX
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.FullGameStatusData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1431 implements IMessageParser 
    {

        private var _SafeStr_7592:FullGameStatusData;


        public function get fullStatus():FullGameStatusData
        {
            return (_SafeStr_7592);
        }

        public function flush():Boolean
        {
            return (false);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7592 = new FullGameStatusData(_arg_1);
            return (true);
        }


    }
}//package _-uX

// _SafeStr_1431 = "_-nb" (String#9908, DoABC#3)
// _SafeStr_7592 = "_-l17" (String#9733, DoABC#3)


