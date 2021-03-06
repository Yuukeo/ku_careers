
function transform_job_2_esx_jobs(jobs)
    local trans_jobs = {}
    local trans_job = {}

    for cycle_name, job_data in pairs(jobs) do
        trans_job.BlipInfos = job_data.BlipInfos

        trans_job.Vehicles = job_data.Vehicles
        trans_job.Vehicles.spawner = nil
        trans_job.Vehicles.dispawner = nil

        trans_job.Zones = {}

        for step, values in pairs(job_data.steps) do
            trans_job.Zones[step] = values.position
            trans_job.Zones[step].Item = {}

            table.insert(trans_job.Zones[step].Item, values)

            trans_job.Zones[step].Item[1].position = nil

            if step == name then
                --trans_job.Delivery =  trans_job.Zones[step].Item[1].vendor

                trans_job.Delivery.Item.requires = job_data.db_name
                trans_job.Delivery.Item.requires_name = job_data.name
            end
        end

        trans_job.Zones.CloakRoom = job_data.CloakRoom
        trans_job.Zones.VehicleSpawner = job_data.Vehicles[1].spawner
        trans_job.Zones.VehicleSpawnPoint = job_data.Vehicles[1].spawn
        trans_job.Zones.VehicleDeletePoint = job_data.Vehicles[1].dispawn

        trans_jobs[cycle_name] = trans_job
    end

    return trans_jobs
end
