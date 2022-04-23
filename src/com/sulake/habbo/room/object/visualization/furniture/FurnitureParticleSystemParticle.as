// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.furniture.FurnitureParticleSystemParticle

package com.sulake.habbo.room.object.visualization.furniture
{
    import flash.geom.Vector3D;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;

    public class FurnitureParticleSystemParticle 
    {

        private var _SafeStr_4050:Number;
        private var _SafeStr_4051:Number;
        private var _SafeStr_4052:Number;
        private var _SafeStr_6688:Number;
        private var _SafeStr_6689:Number;
        private var _SafeStr_6690:Number;
        private var _SafeStr_6691:Boolean = false;
        private var _direction:Vector3D;
        private var _SafeStr_5918:int = 0;
        private var _lifeTime:int;
        private var _SafeStr_6687:Boolean = false;
        private var _SafeStr_6686:Boolean = false;
        private var _fadeTime:Number;
        private var _SafeStr_4172:Number = 1;
        private var _SafeStr_5670:Array;


        public function get fade():Boolean
        {
            return (_SafeStr_6686);
        }

        public function get alphaMultiplier():Number
        {
            return (_SafeStr_4172);
        }

        public function get direction():Vector3D
        {
            return (_direction);
        }

        public function get age():int
        {
            return (_SafeStr_5918);
        }

        public function init(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Vector3D, _arg_5:Number, _arg_6:Number, _arg_7:int, _arg_8:Boolean=false, _arg_9:Array=null, _arg_10:Boolean=false):void
        {
            _SafeStr_4050 = _arg_1;
            _SafeStr_4051 = _arg_2;
            _SafeStr_4052 = _arg_3;
            _direction = new Vector3D(_arg_4.x, _arg_4.y, _arg_4.z);
            _direction.scaleBy(_arg_5);
            _SafeStr_6688 = (_SafeStr_4050 - (_direction.x * _arg_6));
            _SafeStr_6689 = (_SafeStr_4051 - (_direction.y * _arg_6));
            _SafeStr_6690 = (_SafeStr_4052 - (_direction.z * _arg_6));
            _SafeStr_5918 = 0;
            _SafeStr_6691 = false;
            _lifeTime = _arg_7;
            _SafeStr_6687 = _arg_8;
            _SafeStr_5670 = _arg_9;
            _SafeStr_6686 = _arg_10;
            _SafeStr_4172 = 1;
            _fadeTime = (0.5 + (Math.random() * 0.5));
        }

        public function update():void
        {
            _SafeStr_5918++;
            if (_SafeStr_5918 == _lifeTime)
            {
                ignite();
            };
            if (_SafeStr_6686)
            {
                if ((_SafeStr_5918 / _lifeTime) > _fadeTime)
                {
                    _SafeStr_4172 = ((_lifeTime - _SafeStr_5918) / (_lifeTime * (1 - _fadeTime)));
                };
            };
        }

        public function getAsset():IGraphicAsset
        {
            if (((_SafeStr_5670) && (_SafeStr_5670.length > 0)))
            {
                return (_SafeStr_5670[(_SafeStr_5918 % _SafeStr_5670.length)]);
            };
            return (null);
        }

        protected function ignite():void
        {
        }

        public function get isEmitter():Boolean
        {
            return (_SafeStr_6687);
        }

        public function get isAlive():Boolean
        {
            return (_SafeStr_5918 <= _lifeTime);
        }

        public function dispose():void
        {
            _direction = null;
        }

        public function get x():Number
        {
            return (_SafeStr_4050);
        }

        public function get y():Number
        {
            return (_SafeStr_4051);
        }

        public function get z():Number
        {
            return (_SafeStr_4052);
        }

        public function set x(_arg_1:Number):void
        {
            _SafeStr_4050 = _arg_1;
        }

        public function set y(_arg_1:Number):void
        {
            _SafeStr_4051 = _arg_1;
        }

        public function set z(_arg_1:Number):void
        {
            _SafeStr_4052 = _arg_1;
        }

        public function get lastX():Number
        {
            return (_SafeStr_6688);
        }

        public function set lastX(_arg_1:Number):void
        {
            _SafeStr_6691 = true;
            _SafeStr_6688 = _arg_1;
        }

        public function get lastY():Number
        {
            return (_SafeStr_6689);
        }

        public function set lastY(_arg_1:Number):void
        {
            _SafeStr_6691 = true;
            _SafeStr_6689 = _arg_1;
        }

        public function get lastZ():Number
        {
            return (_SafeStr_6690);
        }

        public function set lastZ(_arg_1:Number):void
        {
            _SafeStr_6691 = true;
            _SafeStr_6690 = _arg_1;
        }

        public function get hasMoved():Boolean
        {
            return (_SafeStr_6691);
        }

        public function toString():String
        {
            return ([_SafeStr_4050, _SafeStr_4051, _SafeStr_4052].toString());
        }

        public function copy(_arg_1:FurnitureParticleSystemParticle, _arg_2:Number):void
        {
            _SafeStr_4050 = (_arg_1._SafeStr_4050 * _arg_2);
            _SafeStr_4051 = (_arg_1._SafeStr_4051 * _arg_2);
            _SafeStr_4052 = (_arg_1._SafeStr_4052 * _arg_2);
            _SafeStr_6688 = (_arg_1._SafeStr_6688 * _arg_2);
            _SafeStr_6689 = (_arg_1._SafeStr_6689 * _arg_2);
            _SafeStr_6690 = (_arg_1._SafeStr_6690 * _arg_2);
            _SafeStr_6691 = _arg_1.hasMoved;
            _direction = _arg_1._direction;
            _SafeStr_5918 = _arg_1._SafeStr_5918;
            _lifeTime = _arg_1._lifeTime;
            _SafeStr_6687 = _arg_1._SafeStr_6687;
            _SafeStr_6686 = _arg_1._SafeStr_6686;
            _fadeTime = _arg_1._fadeTime;
            _SafeStr_4172 = _arg_1._SafeStr_4172;
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_4050 = "_-22N" (String#402, DoABC#4)
// _SafeStr_4051 = "_-1L" (String#429, DoABC#4)
// _SafeStr_4052 = "_-Rt" (String#1279, DoABC#4)
// _SafeStr_4172 = "_-y1Y" (String#3594, DoABC#4)
// _SafeStr_5670 = "_-kH" (String#1221, DoABC#4)
// _SafeStr_5918 = "_-q1i" (String#2983, DoABC#4)
// _SafeStr_6686 = "_-512" (String#9573, DoABC#4)
// _SafeStr_6687 = "_-V19" (String#10348, DoABC#4)
// _SafeStr_6688 = "_-32P" (String#8422, DoABC#4)
// _SafeStr_6689 = "_-FP" (String#8399, DoABC#4)
// _SafeStr_6690 = "_-lv" (String#8683, DoABC#4)
// _SafeStr_6691 = "_-e1e" (String#6239, DoABC#4)


