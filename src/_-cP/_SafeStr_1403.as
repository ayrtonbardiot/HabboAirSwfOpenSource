// by nota

//_-cP._SafeStr_1403

package _-cP
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1403 implements IMessageParser 
    {

        private var _SafeStr_4222:int;
        private var _officialSongId:String;


        public function flush():Boolean
        {
            _SafeStr_4222 = 0;
            _officialSongId = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _officialSongId = _arg_1.readString();
            _SafeStr_4222 = _arg_1.readInteger();
            return (true);
        }

        public function get songId():int
        {
            return (_SafeStr_4222);
        }

        public function get officialSongId():String
        {
            return (_officialSongId);
        }


    }
}//package _-cP

// _SafeStr_1403 = "_-13" (String#6590, DoABC#3)
// _SafeStr_4222 = "_-Tb" (String#8526, DoABC#3)


