class Tire 
{
	private _type:string;
	private _desc:string;

	constructor(tire:string)
	{
		this.setType(tire);
	}
	public getType():string
	{
		return this._type;
	}
	public setType(tire:string):void
	{
		switch(tire)
		{
			case TireType.SNOW:
				this._type = tire;
				this._desc = "storm-ready snow";
				break;

			case TireType.HIGH_PERFORMANCE:
				this._type = tire;
				this._desc = "high-perf radial!";
				break;

			case TireType.ECONOMICAL:
			default:
				this._type = tire;
				this._desc = "economical bias-ply";
		}
	}
}