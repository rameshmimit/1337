///<reference path='vehicle.ts'/>
///<reference path='tire.ts'/>
///<reference path='tireType.ts'/>
///<reference path='cdplayer.ts'/>

class Car extends Vehicle 
{
	private _tires:Tire;

	constructor(mpg:number, fuel:number)
	{
		super(mpg, fuel);

		this.name = "Car";

		this._tires = new Tire(TireType.HIGH_PERFORMANCE);
		this.soundSystem = new CDPlayer();

		console.log(this.name, "has", this._tires.getType(), 'tires');
	}

	public useAccessory():void
	{
		this.openSunroof();
	}
	private openSunroof():void
	{
		console.log(this.name, "opened sunroof");
	}
}