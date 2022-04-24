﻿// by nota

//com.sulake.habbo.room.object.visualization.furniture.FurnitureFireworksVisualization

package com.sulake.habbo.room.object.visualization.furniture
{
    import flash.utils.Dictionary;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;

    public class FurnitureFireworksVisualization extends AnimatedFurnitureVisualization 
    {

        private var _particleSystems:Dictionary;
        private var _SafeStr_5089:FurnitureParticleSystem;


        override public function dispose():void
        {
            super.dispose();
            _SafeStr_5089 = null;
            if (_particleSystems)
            {
                for each (var _local_1:FurnitureParticleSystem in _particleSystems)
                {
                    _local_1.dispose();
                };
                _particleSystems = null;
            };
        }

        override protected function updateObject(_arg_1:Number, _arg_2:Number):Boolean
        {
            var _local_3:Boolean;
            var _local_4:* = null;
            if (super.updateObject(_arg_1, _arg_2))
            {
                _local_3 = false;
                if (!_particleSystems)
                {
                    readDefinition();
                    if (_particleSystems)
                    {
                        _SafeStr_5089 = _particleSystems[_arg_1];
                        _local_3 = true;
                    }
                    else
                    {
                        _SafeStr_14.log(("ERROR Particle systems could not be read! " + this.object.getType()));
                    };
                }
                else
                {
                    if (((!(_arg_1 == _SafeStr_4175)) || (!(_particleSystems[_arg_1] == _SafeStr_5089))))
                    {
                        _local_4 = _particleSystems[_arg_1];
                        _local_4.copyStateFrom(_SafeStr_5089);
                        if (_SafeStr_5089)
                        {
                            _SafeStr_5089.reset();
                        };
                        _SafeStr_5089 = _local_4;
                        _local_3 = true;
                    };
                };
                return (true);
            };
            return (false);
        }

        override protected function updateSprites(_arg_1:int, _arg_2:Boolean, _arg_3:int):void
        {
            super.updateSprites(_arg_1, _arg_2, _arg_3);
            if (_SafeStr_5089)
            {
                _SafeStr_5089.updateSprites();
            };
        }

        override protected function updateAnimation(_arg_1:Number):int
        {
            if (_SafeStr_5089)
            {
                _SafeStr_5089.updateAnimation();
            };
            return (super.updateAnimation(_arg_1));
        }

        override protected function setAnimation(_arg_1:int):void
        {
            if (_SafeStr_5089)
            {
                _SafeStr_5089.setAnimation(_arg_1);
            };
            super.setAnimation(_arg_1);
        }

        override protected function getSpriteYOffset(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            if (((_SafeStr_5089) && (_SafeStr_5089.controlsSprite(_arg_3))))
            {
                return (_SafeStr_5089.getSpriteYOffset(_arg_1, _arg_2, _arg_3));
            };
            return (super.getSpriteYOffset(_arg_1, _arg_2, _arg_3));
        }

        private function readDefinition():Boolean
        {
            var _local_1:* = null;
            var _local_4:int;
            var _local_5:IRoomObject = object;
            if (_local_5 == null)
            {
                return (false);
            };
            var _local_7:IRoomObjectModel = _local_5.getModel();
            if (_local_7 == null)
            {
                return (false);
            };
            var _local_6:String = _local_7.getString("furniture_fireworks_data");
            if (((!(_local_6)) || (_local_6.length == 0)))
            {
                _SafeStr_14.log("No Particle System Data Found.");
                return (false);
            };
            var _local_3:XML = XML(_local_6);
            _particleSystems = new Dictionary();
            for each (var _local_2:XML in _local_3.particlesystem)
            {
                if (!_local_2.hasOwnProperty("@size"))
                {
                    _SafeStr_14.log("Particle System does not have size property!");
                }
                else
                {
                    _local_4 = int(_local_2.@size);
                    _local_1 = new FurnitureParticleSystem(this);
                    _local_1.parseData(_local_2);
                    _particleSystems[_local_4] = _local_1;
                };
            };
            return (true);
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_4175 = "_-W1q" (String#3259, DoABC#4)
// _SafeStr_5089 = "_-J1d" (String#3761, DoABC#4)


