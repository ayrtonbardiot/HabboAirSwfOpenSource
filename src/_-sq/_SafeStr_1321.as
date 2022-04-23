// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-sq._SafeStr_1321

package _-sq
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameObjectsData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1321 implements IMessageParser 
    {

        private var _SafeStr_5732:GameObjectsData;
        private var _SafeStr_5722:int;
        private var _SafeStr_7258:String;
        private var _SafeStr_6853:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5722 = _arg_1.readInteger();
            _SafeStr_7258 = _arg_1.readString();
            _SafeStr_6853 = _arg_1.readInteger();
            _SafeStr_5732 = new GameObjectsData(_arg_1);
            return (true);
        }

        public function get gameObjects():GameObjectsData
        {
            return (_SafeStr_5732);
        }

        public function get gameType():int
        {
            return (_SafeStr_5722);
        }

        public function get roomType():String
        {
            return (_SafeStr_7258);
        }

        public function get countDown():int
        {
            return (_SafeStr_6853);
        }


    }
}//package _-sq

// _SafeStr_1321 = "_-e1s" (String#9290, DoABC#3)
// _SafeStr_5722 = "_-A1H" (String#7218, DoABC#3)
// _SafeStr_5732 = "_-AT" (String#7285, DoABC#3)
// _SafeStr_6853 = "_-e1p" (String#9287, DoABC#3)
// _SafeStr_7258 = "_-U1X" (String#8556, DoABC#3)


