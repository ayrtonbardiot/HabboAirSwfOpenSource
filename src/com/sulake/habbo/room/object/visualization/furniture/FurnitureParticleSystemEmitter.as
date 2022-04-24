// by nota

//com.sulake.habbo.room.object.visualization.furniture.FurnitureParticleSystemEmitter

package com.sulake.habbo.room.object.visualization.furniture
{
    import flash.geom.Vector3D;
    import flash.utils.Dictionary;

    public class FurnitureParticleSystemEmitter extends FurnitureParticleSystemParticle 
    {

        public static const SHAPE_CONE:String = "cone";
        public static const SHAPE_PLANE:String = "plane";
        public static const SHAPE_SPHERE:String = "sphere";

        private var _name:String;
        private var _SafeStr_6738:int = -1;
        private var _SafeStr_6731:Number;
        private var _direction:Vector3D;
        private var _SafeStr_6732:Number = 0.1;
        private var _SafeStr_4661:Number;
        private var _airFriction:Number;
        private var _SafeStr_6736:String;
        private var _SafeStr_6733:Array;
        private var _SafeStr_6730:Array = [];
        private var _SafeStr_6735:int;
        private var _particlesPerFrame:int;
        private var _SafeStr_6734:int;
        private var _fuseTime:int = 10;
        private var _SafeStr_5925:Number = 1;
        private var _SafeStr_5910:Boolean = false;
        private var _SafeStr_6737:int = 1;

        public function FurnitureParticleSystemEmitter(_arg_1:String="", _arg_2:int=-1)
        {
            _name = _arg_1;
            _SafeStr_6738 = _arg_2;
            _SafeStr_6733 = [];
        }

        override public function dispose():void
        {
            for each (var _local_1:FurnitureParticleSystemParticle in _SafeStr_6730)
            {
                _local_1.dispose();
            };
            _SafeStr_6730 = null;
            _direction = null;
            _SafeStr_6733 = null;
            super.dispose();
        }

        public function setup(_arg_1:int, _arg_2:int, _arg_3:Number, _arg_4:Vector3D, _arg_5:Number, _arg_6:Number, _arg_7:String, _arg_8:Number, _arg_9:int, _arg_10:int):void
        {
            _SafeStr_6735 = _arg_1;
            _particlesPerFrame = _arg_2;
            _SafeStr_6731 = _arg_3;
            _direction = _arg_4;
            _direction.normalize();
            _SafeStr_4661 = _arg_5;
            _airFriction = _arg_6;
            _SafeStr_6736 = _arg_7;
            _fuseTime = _arg_9;
            _SafeStr_5925 = _arg_8;
            _SafeStr_6737 = _arg_10;
            reset();
        }

        public function reset():void
        {
            for each (var _local_1:FurnitureParticleSystemParticle in _SafeStr_6730)
            {
                _local_1.dispose();
            };
            _SafeStr_6730 = [];
            _SafeStr_6734 = 0;
            _SafeStr_5910 = false;
            this.init(0, 0, 0, _direction, _SafeStr_6731, _SafeStr_6732, _fuseTime, true);
        }

        public function copyStateFrom(_arg_1:FurnitureParticleSystemEmitter, _arg_2:Number):void
        {
            super.copy(_arg_1, _arg_2);
            _SafeStr_6731 = _arg_1._SafeStr_6731;
            _direction = _arg_1._direction;
            _SafeStr_4661 = _arg_1._SafeStr_4661;
            _airFriction = _arg_1._airFriction;
            _SafeStr_6736 = _arg_1._SafeStr_6736;
            _fuseTime = _arg_1._fuseTime;
            _SafeStr_5925 = _arg_1._SafeStr_5925;
            _SafeStr_6737 = _arg_1._SafeStr_6737;
            _SafeStr_6732 = _arg_1._SafeStr_6732;
            _SafeStr_5910 = _arg_1._SafeStr_5910;
        }

        public function configureParticle(_arg_1:int, _arg_2:Boolean, _arg_3:Array, _arg_4:Boolean):void
        {
            var _local_5:Dictionary = new Dictionary();
            _local_5["lifeTime"] = _arg_1;
            _local_5["isEmitter"] = _arg_2;
            _local_5["frames"] = _arg_3;
            _local_5["fade"] = _arg_4;
            _SafeStr_6733.push(_local_5);
        }

        override protected function ignite():void
        {
            _SafeStr_5910 = true;
            if (_SafeStr_6734 < _SafeStr_6735)
            {
                if (this.age > 1)
                {
                    releaseParticles(this, this.direction);
                };
            };
        }

        private function releaseParticles(_arg_1:FurnitureParticleSystemParticle, _arg_2:Vector3D=null):void
        {
            var _local_8:* = null;
            var _local_3:* = null;
            var _local_10:int;
            var _local_6:* = null;
            var _local_7:int;
            if (!_arg_2)
            {
                _arg_2 = new Vector3D();
            };
            var _local_9:Vector3D = new Vector3D();
            var _local_4:Boolean;
            var _local_5:Boolean;
            _local_3 = getRandomParticleConfiguration();
            _local_7 = 0;
            while (_local_7 < _particlesPerFrame)
            {
                switch (_SafeStr_6736)
                {
                    case "cone":
                        _local_9.x = ((randomBoolean(0.5)) ? Math.random() : -(Math.random()));
                        _local_9.y = -(Math.random() + 1);
                        _local_9.z = ((randomBoolean(0.5)) ? Math.random() : -(Math.random()));
                        break;
                    case "plane":
                        _local_9.x = ((randomBoolean(0.5)) ? Math.random() : -(Math.random()));
                        _local_9.y = 0;
                        _local_9.z = ((randomBoolean(0.5)) ? Math.random() : -(Math.random()));
                        break;
                    case "sphere":
                        _local_9.x = ((randomBoolean(0.5)) ? Math.random() : -(Math.random()));
                        _local_9.y = ((randomBoolean(0.5)) ? Math.random() : -(Math.random()));
                        _local_9.z = ((randomBoolean(0.5)) ? Math.random() : -(Math.random()));
                };
                _local_9.normalize();
                _local_8 = new FurnitureParticleSystemParticle();
                if (_local_3)
                {
                    _local_10 = Math.floor(((Math.random() * _local_3["lifeTime"]) + 10));
                    _local_4 = _local_3["isEmitter"];
                    _local_6 = _local_3["frames"];
                    _local_5 = _local_3["fade"];
                }
                else
                {
                    _local_10 = int(Math.floor(((Math.random() * 20) + 10)));
                    _local_4 = false;
                    _local_6 = [];
                };
                _local_8.init(_arg_1.x, _arg_1.y, _arg_1.z, _local_9, _SafeStr_5925, _SafeStr_6732, _local_10, _local_4, _local_6, _local_5);
                _SafeStr_6730.push(_local_8);
                _SafeStr_6734++;
                _local_7++;
            };
        }

        private function getRandomParticleConfiguration():Dictionary
        {
            var _local_1:int = int(Math.floor((Math.random() * _SafeStr_6733.length)));
            return (_SafeStr_6733[_local_1]);
        }

        override public function update():void
        {
            super.update();
            accumulateForces();
            verlet();
            satisfyConstraints();
            if (((!(isAlive)) && (_SafeStr_6734 < _SafeStr_6735)))
            {
                if ((this.age % _SafeStr_6737) == 0)
                {
                    releaseParticles(this, this.direction);
                };
            };
        }

        public function verlet():void
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:* = null;
            if (((isAlive) || (_SafeStr_6734 < _SafeStr_6735)))
            {
                _local_2 = this.x;
                _local_3 = this.y;
                _local_4 = this.z;
                this.x = (((2 - _airFriction) * this.x) - ((1 - _airFriction) * this.lastX));
                this.y = ((((2 - _airFriction) * this.y) - ((1 - _airFriction) * this.lastY)) + ((_SafeStr_4661 * _SafeStr_6732) * _SafeStr_6732));
                this.z = (((2 - _airFriction) * this.z) - ((1 - _airFriction) * this.lastZ));
                this.lastX = _local_2;
                this.lastY = _local_3;
                this.lastZ = _local_4;
            };
            var _local_1:Array = [];
            for each (_local_5 in _SafeStr_6730)
            {
                _local_5.update();
                _local_2 = _local_5.x;
                _local_3 = _local_5.y;
                _local_4 = _local_5.z;
                _local_5.x = (((2 - _airFriction) * _local_5.x) - ((1 - _airFriction) * _local_5.lastX));
                _local_5.y = ((((2 - _airFriction) * _local_5.y) - ((1 - _airFriction) * _local_5.lastY)) + ((_SafeStr_4661 * _SafeStr_6732) * _SafeStr_6732));
                _local_5.z = (((2 - _airFriction) * _local_5.z) - ((1 - _airFriction) * _local_5.lastZ));
                _local_5.lastX = _local_2;
                _local_5.lastY = _local_3;
                _local_5.lastZ = _local_4;
                if (((_local_5.y > 10) || (!(_local_5.isAlive))))
                {
                    _local_1.push(_local_5);
                };
            };
            for each (_local_5 in _local_1)
            {
                if (_local_5.isEmitter)
                {
                };
                _SafeStr_6730.splice(_SafeStr_6730.indexOf(_local_5), 1);
                _local_5.dispose();
            };
        }

        private function satisfyConstraints():void
        {
        }

        private function accumulateForces():void
        {
            for each (var _local_1:FurnitureParticleSystemParticle in _SafeStr_6730)
            {
            };
        }

        public function get particles():Array
        {
            return (_SafeStr_6730);
        }

        public function get hasIgnited():Boolean
        {
            return (_SafeStr_5910);
        }

        private function randomBoolean(_arg_1:Number):Boolean
        {
            return (Math.random() < _arg_1);
        }

        public function get roomObjectSpriteId():int
        {
            return (_SafeStr_6738);
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_4661 = "_-w14" (String#5811, DoABC#4)
// _SafeStr_5910 = "_-zz" (String#4016, DoABC#4)
// _SafeStr_5925 = "_-71Q" (String#3989, DoABC#4)
// _SafeStr_6730 = "_-q1J" (String#5002, DoABC#4)
// _SafeStr_6731 = "_-31D" (String#10991, DoABC#4)
// _SafeStr_6732 = "_-x1t" (String#7294, DoABC#4)
// _SafeStr_6733 = "_-o10" (String#9456, DoABC#4)
// _SafeStr_6734 = "_-qd" (String#8563, DoABC#4)
// _SafeStr_6735 = "_-w1Z" (String#12492, DoABC#4)
// _SafeStr_6736 = "_-l4" (String#10344, DoABC#4)
// _SafeStr_6737 = "_-Y1j" (String#10373, DoABC#4)
// _SafeStr_6738 = "_-115" (String#20628, DoABC#4)


