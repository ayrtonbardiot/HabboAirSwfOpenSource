// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-TY.Game2InArenaQueueMessageParser

package _-TY
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2InArenaQueueMessageParser implements IMessageParser 
    {

        private var _position:int;


        public function get position():int
        {
            return (_position);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _position = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-TY

