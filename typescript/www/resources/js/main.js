var Vehicle = (function () {
    function Vehicle(mpg, fuel) {
        if (typeof mpg === "undefined") { mpg = 21; }
        if (typeof fuel === "undefined") { fuel = 18.5; }
        this._moving = false;
        this._gasMileage = mpg;
        this._fuelAvailable = fuel;
        this._milesTraveled = 0;
    }
    Vehicle.prototype.useAccessory = function () {
        console.log(this.name, 'turned on lights');
    };
    Vehicle.prototype.changeGear = function () {
        console.log(this.name, 'changed gear');
    };
    Vehicle.prototype.drive = function () {
        this._fuelAvailable--;
        this._milesTraveled += this._gasMileage;
        if(this._fuelAvailable > 0) {
            this.drive();
        } else {
            console.log("The", this.name, "has a gas mileage of", this._gasMileage, "and traveled", this._milesTraveled, "miles.");
        }
    };
    Vehicle.prototype.getGasMileage = function () {
        return this._gasMileage;
    };
    Vehicle.prototype.setGasMileage = function (mpg) {
        this._gasMileage = mpg;
    };
    Vehicle.prototype.getFuelAvailable = function () {
        return this._fuelAvailable;
    };
    Vehicle.prototype.setFuelAvailable = function (fuel) {
        this._fuelAvailable = fuel;
    };
    Vehicle.prototype.getMilesTraveled = function () {
        return this._milesTraveled;
    };
    return Vehicle;
})();
var Tire = (function () {
    function Tire(tire) {
        this.setType(tire);
    }
    Tire.prototype.getType = function () {
        return this._type;
    };
    Tire.prototype.setType = function (tire) {
        switch(tire) {
            case TireType.SNOW: {
                this._type = tire;
                this._desc = "storm-ready snow";
                break;

            }
            case TireType.HIGH_PERFORMANCE: {
                this._type = tire;
                this._desc = "high-perf radial!";
                break;

            }
            case TireType.ECONOMICAL:
            default: {
                this._type = tire;
                this._desc = "economical bias-ply";

            }
        }
    };
    return Tire;
})();
var TireType = (function () {
    function TireType() { }
    TireType.SNOW = 'snow';
    TireType.HIGH_PERFORMANCE = 'highPerf';
    TireType.ECONOMICAL = 'economical';
    return TireType;
})();
var CDPlayer = (function () {
    function CDPlayer() {
        this.isPlaying = false;
    }
    CDPlayer.prototype.turnOn = function () {
        console.log("cd player on");
        this.isPlaying = true;
    };
    CDPlayer.prototype.playSelection = function (preset) {
        console.log('cd player selection play: track', preset);
    };
    CDPlayer.prototype.turnOff = function () {
        console.log('cd player off');
        this.isPlaying = false;
    };
    CDPlayer.prototype.eject = function () {
        console.log("cd player eject");
    };
    return CDPlayer;
})();
var __extends = this.__extends || function (d, b) {
    function __() { this.constructor = d; }
    __.prototype = b.prototype;
    d.prototype = new __();
};
var Car = (function (_super) {
    __extends(Car, _super);
    function Car(mpg, fuel) {
        _super.call(this, mpg, fuel);
        this.name = "Car";
        this._tires = new Tire(TireType.HIGH_PERFORMANCE);
        this.soundSystem = new CDPlayer();
        console.log(this.name, "has", this._tires.getType(), 'tires');
    }
    Car.prototype.useAccessory = function () {
        this.openSunroof();
    };
    Car.prototype.openSunroof = function () {
        console.log(this.name, "opened sunroof");
    };
    return Car;
})(Vehicle);
var Radio = (function () {
    function Radio() {
        this.isPlaying = false;
    }
    Radio.prototype.turnOn = function () {
        console.log('radio on');
        this.isPlaying = false;
    };
    Radio.prototype.playSelection = function (preset) {
        console.log('radio selection play: channel preset', preset);
    };
    Radio.prototype.turnOff = function () {
        console.log('radio off');
        this.isPlaying = false;
    };
    return Radio;
})();
var Truck = (function (_super) {
    __extends(Truck, _super);
    function Truck(mpg, fuel) {
        _super.call(this, mpg, fuel);
        this.name = 'Truck';
        this._tires = new Tire(TireType.SNOW);
        this.soundSystem = new Radio();
        console.log(this.name, 'has', this._tires.getType(), 'tires');
    }
    Truck.prototype.useAccessory = function () {
        _super.prototype.useAccessory.call(this);
        this.lowerTailgate();
    };
    Truck.prototype.lowerTailgate = function () {
        console.log(this.name, 'lowered tailgate');
    };
    return Truck;
})(Vehicle);
var Main = (function () {
    function Main() {
        this._compact = new Car(21, 18);
        this._compact.changeGear();
        this._compact.useAccessory();
        this._pickup = new Truck(16, 23);
        this._pickup.changeGear();
        this._pickup.useAccessory();
        this._compact.soundSystem.turnOn();
        this._compact.soundSystem.playSelection(2);
        this._pickup.soundSystem.turnOn();
        this._compact.drive();
        this._pickup.drive();
    }
    return Main;
})();
