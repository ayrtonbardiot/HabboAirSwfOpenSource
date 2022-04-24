// by nota

//_-g1G._SafeStr_1089

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1089 implements IMessageParser 
    {

        private var _SafeStr_7239:Boolean;
        private var _newFurniDataHash:String;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7239 = _arg_1.readBoolean();
            if (_arg_1.bytesAvailable)
            {
                _newFurniDataHash = _arg_1.readString();
            };
            return (true);
        }

        public function get instantlyRefreshCatalogue():Boolean
        {
            return (_SafeStr_7239);
        }

        public function get newFurniDataHash():String
        {
            return (_newFurniDataHash);
        }


    }
}//package _-g1G

// _SafeStr_1089 = "_-an" (String#9027, DoABC#3)
// _SafeStr_7239 = "_-29" (String#6687, DoABC#3)


